class MoversController < ApplicationController
  before_action :find_mover, only: [:show, :edit, :update, :destroy]
  before_action :find_moving_event, only:[:update]

  def new
    @mover = Mover.new
    @mover.build_user

  end

  def create
    @mover = Mover.new(mover_params)
    p mover_params[:user_attributes]
    if @mover.save!
    @mover.create_user(mover_params[:user_attributes])
      redirect_to @mover
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @moving_event.movers.count <= @moving_event.movers_needed
        @mover.moving_event_id = @moving_event.id
        @mover.movee_id = @moving_event.movee_id
        if @mover.update(mover_params)
          flash[:notice] = "Successfully updated"
          redirect_to movee_moving_event_path(@mover.movee_id, @mover.moving_event_id)
        else
          render 'edit'
        end
    else
      flash[:notice] = "Movers are not needed please try again"
    end
  end

  def show
  end

  def destroy
  end

  def index
    @movers = Mover.all
  end

  private

  def mover_params
    params.require(:mover).permit(:first_name, :last_name, :age, :occupation, :phone_number, :location_street, :location_city, :location_state, :moving_event_id, :id, user_attributes: [ :id, :username, :email, :password ])
  end

  def find_mover
    @mover = Mover.find(params[:id])
  end

  def all_moving_events
    @moving_events = MovingEvent.all
  end

  def find_moving_event
    @moving_event = MovingEvent.find_by(params[:moving_event_id])
  end

  def find_movee
    @movee = Movee.find(params:[:movee_id])
  end
end
