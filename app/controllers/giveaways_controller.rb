class GiveawaysController < ApplicationController
  before_action :find_moving_event
  before_action :find_movee
  before_action :find_giveaway, only:[:destroy]

  def new
    @giveaway = Giveaway.new
  end

  def create
    @giveaway = Giveaway.new(giveaway_params)
    @giveaway.moving_event_id = @moving_event.id

    if @giveaway.save
      redirect_to movee_moving_event_path(@movee.id, @moving_event.id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def index
    @giveaway = Giveaway.all
  end

  def show
  end

  def destroy
    p @giveaway = Giveaway.find(params[:id])
    p "This is the params"
    p @giveaway
    @giveaway.destroy
    p @giveaway
    respond_to do |format|
      format.js
    end
  end

  private

  def giveaway_params
    params.require(:giveaway).permit(:item_name, :condition)
  end

  def find_moving_event
    @moving_event = MovingEvent.find(params[:moving_event_id])
  end

  def find_movee
    @movee = Movee.find(params[:movee_id])
  end

  def find_giveaway
    @giveaway = Giveaway.find(params[:id])
  end
end
