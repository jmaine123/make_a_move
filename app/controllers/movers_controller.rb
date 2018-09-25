class MoversController < ApplicationController
  before_action :find_mover, only: [:show, :edit, :update, :destroy]
  def new
    @mover = Mover.new
  end

  def create
    @mover = Mover.new(mover_params)
    if @mover.save
      redirect_to @mover
    else
      render 'new'
    end
  end

  def edit
  end

  def update

  end

  def show
  end

  def index
    @movers = Mover.all
  end

  private

  def mover_params
    params.require(:mover).permit(:first_name, :last_name, :age, :email, :occupation, :location)
  end

  def find_mover
    @mover = Mover.find(params[:id])
  end
end
