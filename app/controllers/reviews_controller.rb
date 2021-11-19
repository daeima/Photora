class ReviewsController < ApplicationController
  # /venues/:venue_id/reviews

  def create
    @review = Review.new(reviews_params)
    @review.venue = Venue.find(params[:venue_id])
    if @review.save!
      redirect_to review_path(@review)
    else
      render 'venues/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :venue)
  end
end
