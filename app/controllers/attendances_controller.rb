class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :set_event, only: [:new, :destroy]

  def new
    if user_attending?
      flash[:error] = "You are already attending: #{@event.title}"
    else
      @event.attendees << current_user
      flash[:success] = "You are now attending: #{@event.title}"
    end
    redirect_to event_path(@event)
  end

  def destroy
    if user_attending?
      @event.attendances.find_by(attendee_id: current_user.id).destroy
      flash[:success] = "You are no longer attending: #{@event.title}"
    else
      flash[:error] = "You are not attending: #{@event.title}"
    end
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id] || params[:id])
  end

  def user_attending?
    @event.attendees.include?(current_user)
  end
end
