class Public::ReviewsController < ApplicationController

  def index
    @genre = Genre.all # headerの部分テンプレート用
    if params[:design_id].present?
      @design = Design.find(params[:design_id])
      @reviews = @design.reviews
    end
  end

  def new
    @genre = Genre.all # headerの部分テンプレート用
    @design = Design.find(params[:design_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if params[:review][:rate].present?
      @review.save
      redirect_to reviews_path(design_id: @review.design_id)#or (design_id: params[:review][:design_id])でもOK
    else
      @genre = Genre.all
      @design = Design.find(params[:review][:design_id])
      flash[:danger] = "※星評価をしてください。"
      render :new
      # redirect_to
    end
  end



  private

  def review_params
    params.require(:review).permit(:design_id, :customer_id, :rate, :body, :image)
  end

end