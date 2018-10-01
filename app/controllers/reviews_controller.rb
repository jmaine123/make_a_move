class ReviewsController < ApplicationController
  before_action :find_mover
  before_action :authenticate_user!
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.mover_id = @mover.id
    if @review.save
      redirect_to @mover
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def show
  end

  def index
  end

  private

  def find_mover
    @mover = Mover.find_by(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :mover_rating)
  end
end
