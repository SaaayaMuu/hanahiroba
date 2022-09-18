class Public::ReviewsController < ApplicationController

  def index
    if params[:design_id].present?
      @design = Design.find(params[:design_id])
      @reviews = @design.reviews
    end
  end

  def new
    @review = Review.new
    if params[:design_id].present?
      @design = Design.find(params[:design_id])
      @review.design_id = @design
    end
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save(review_params)
  end



  private

  def review_params
    params.require(:review).permit(:design_id, :customer_id, :rate, :body, :image)
  end

end