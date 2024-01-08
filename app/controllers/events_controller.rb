class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_event_creator, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find_by(id: params[:id])

    unless @event
      flash[:error] = "Event not found"
      redirect_to root_path
    end
  end

  def check_event_creator
    unless @event.creator == current_user
      flash[:error] = "You must be the Happening Creator to perform this action."
      redirect_to event_path(@event)
    end
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :private)
  end
end
