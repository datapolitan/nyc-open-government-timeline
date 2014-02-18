class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @categories = Event.all.map{|e| e.category}.uniq
    @event = Event.new(params_event)
    if @event.save
      redirect_to event_path
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params_event)
      redirect_to event_path
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path 
  end

  def show
    @event = Event.find(params[:id])
  end

  private
    def params_event
      params.require(:event).permit(:name, :description, :category, :date, :url, :status)
    end
end
