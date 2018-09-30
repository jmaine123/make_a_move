class MoveesController < ApplicationController
  before_action :find_movee, only: [:show, :edit, :update, :destroy]

  def new
    @movee = Movee.new
    @movee.build_user
  end

  def create
    @movee = Movee.new(movee_params)
      p "User attributes #{movee_params}"
    if @movee.save
      redirect_to @movee
    else
      render 'new'
    end
  end

  def edit
  end

  def show

  end

  def index
    @movees = Movee.all
  end

  def destroy
  end


  private

  def movee_params
    params.require(:movee).permit(:first_name, :last_name, :age, :email, :occupation, :location_street, :location_city, :location_state, :phone_number, user_attributes: [ :id, :username, :email, :password ])
  end

  def find_movee
    @movee = Movee.find(params[:id])
  end
end
