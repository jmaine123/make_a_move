class RequestsController < ApplicationController
  before_action :find_mover

  def new
    @request = Request.new
    p "Im in the new"

  end

  def create
    @request = Request.new(params)
    @request.status = 'Pending'
    p "Im in the create: #{params}"
    @request.moving_event_id = params[:moving_event_id]
    @request.mover_id = params[:mover_id]
    if @request.save
      redirect_to mover_path(current_user.meta_id)
    end
  end

  def edit
  end

  def index
  end

  def show
  end

  def destroy
  end

  def index
  end

  private

  def request_params
    params.require(:request).permit(:moving_event_id,:mover_id)
  end

  def find_mover
    @mover = Mover.find_by(params[:id])
  end


end
