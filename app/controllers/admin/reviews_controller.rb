class Admin::ReviewsController < ApplicationController


  def index
    @design = Design.find(params[:design_id])
    @reviews = @design.reviews.all
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path(design_id: @review.design_id)
  end

end