class MoversController < ApplicationController
  before_action :find_mover, only: [:show, :edit, :update, :destroy]
  before_action :find_moving_event, only:[:update]
  before_action :all_moving_events
  before_action :find_close_events, only:[:show]


  def new
    @mover = Mover.new
    @mover.build_user

  end

  def create
    current_user
    @mover = Mover.new(mover_params)
    p "User attributes #{mover_params}"
    # @mover.create_user(mover_params[:user_attributes])
    if @mover.save!
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
    @user = User.find_by(meta_id: @mover.id)
    @user.destroy
    @mover.requests.each do |request|
      request.destroy
    end
    @mover.reviews.each do |review|
      review.destroy
    end
    @mover.destroy

    redirect_to root_path

  end

  def index
    @movers = Mover.all
  end

  private

  def mover_params
    params.require(:mover).permit(:first_name, :last_name, :age, :occupation, :phone_number, :location_street, :location_city, :location_state, :moving_event_id, user_attributes: [ :id, :username, :email, :password ])
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

  def find_close_events
    @close_events = []
    MovingEvent.all.each do |event|
      if @mover.distance_to(event, :mi) < 20
        @close_events<< event
      end
    end
    return @close_events
  end

  def find_user
    @user = User.find_by(meta_id)
  end
end
