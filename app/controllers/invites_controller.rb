class InvitesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_event, only: [:create]
  before_action :set_user, only: [:create]

  def new
    @invite = Invite.new
  end

  def create
    invite_user

    flash[:success] = "#{@user.username} is now invited."
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def invite_user
    unless @event.invitees.include?(@user)
      @event.invitees << @user
    end
  end
end
