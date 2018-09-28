class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review(review_params)
  end

  def edit
  end

  def show
  end

  def index
  end
end
