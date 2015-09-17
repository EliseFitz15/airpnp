class ReviewsController < ApplicationController
  def new
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @bathroom = Bathroom.find(params[:bathroom_id])
    @review.bathroom = @bathroom

    if @review.save
      redirect_to bathroom_path(@bathroom)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  protected
  def review_params
    params.require(:review).permit(:body, :rating, :bathroom_id)
  end
end
