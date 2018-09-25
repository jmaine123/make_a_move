class MovingEventsController < ApplicationController
  before_action :find_movee
  def new
    @moving_event = MovingEvent.new
  end

  def create
    @moving_event = MovingEvent.new(moving_event_params)
    @moving_event.movee_id = @movee.id
    if @moving_event.save
      redirect_to movee_moving_events_path(@movee.id)
    else
      render 'new'
    end
  end

  def index
    @moving_event = MovingEvent.all
  end

  def edit
  end

  def update
    if @moving_event.update(moving_event_params)
      flash[:notice] = "Successfully updated"
      
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def moving_event_params
    params.require(:moving_event).permit(:name, :start_time, :end_time,:description, :old_location, :new_location, :amount_of_furniture, :difficulty, :movers_needed, :distance, :mover_id)
  end

  def find_movee
    @movee = Movee.find_by(params[:id])
  end

end
