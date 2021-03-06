class MovingEventsController < ApplicationController
  before_action :find_moving_event, except:[:new, :create, :index]
  before_action :find_movee


  def new
    @moving_event = MovingEvent.new
    flash[:notice] = 'Please Sign up to create a moving event '
  end

  def create
    @moving_event = MovingEvent.new(moving_event_params)
    @moving_event.movee_id = @movee.id
    if @moving_event.save
      redirect_to movee_moving_events_path(@movee.id, @moving_event.id)
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
      redirect_to movee_moving_event_path(@movee.id, @moving_event.id)
    else
      render 'edit'
    end
  end

  def destroy
    @moving_event.requests.each do |request|
      request.destroy
    end
    @moving_event.movers.each do |mover|
      mover.moving_event_id = nil
    end

    @moving_event.giveaways.each do |giveaway|
      giveaway.destroy
    end
    @moving_event.destroy
    redirect_to movee_path(@movee.id)

  end

  def show
  end

  def complete_event
    @moving_event = MovingEvent.find(params[:moving_event_id])
    @moving_event.movers.each do |mover|
        if mover.karma_points != nil
            if @moving_event.difficulty == 'easy'
              mover.karma_points_increase(3)
            elsif @moving_event.difficulty == 'medium'
              mover.karma_points_increase(6)
            else
              mover.karma_points_increase(9)
            end
        end
        mover.save
    end
    redirect_to movee_moving_event_path(@movee.id, @moving_event.id)

  end

  private

  def moving_event_params
    params.require(:moving_event).permit(:name, :start_date, :start_time,:description, :old_location_street, :old_location_city, :old_location_state, :new_location_street, :new_location_city, :new_location_state, :amount_of_furniture, :difficulty, :movers_needed, :estimate_hours, :payment_per_hour, :mover_id, :movee_id)
  end

  def find_movee
    @movee = Movee.find(params[:movee_id])
    p params[:id]
  end

  def find_moving_event
    @moving_event = MovingEvent.find(params[:id])
  end

  def find_mover
    @movers = Mover.find(params[:mover_id])
  end

end
