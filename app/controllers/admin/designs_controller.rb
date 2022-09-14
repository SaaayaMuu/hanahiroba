class Admin::DesignsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @designs = Design.all
  end

  def new
    @design = Design.new
    item = @design.items.build
  end

  def create
    @design = Design.new(design_params)
    if @design.save
      redirect_to admin_design_path(@design.id)
    else
      redirect_to admin_genres_path
    end
  end

  def show
    @design = Design.find(params[:id])
    @items = @design.items.all
  end

  def edit
    @design = Design.find(params[:id])
    @items = @design.items.all
  end

  def update
    @design= Design.find(params[:id])
    if @design.update(design_params)
      redirect_to admin_design_path(@design.id)
    else
      redirect_to admin_genres_path
    end
  end

  def destroy
    @design = Design.find(params[:id])
    @design.destroy
    redirect_to admin_designs_path
  end


  private

  def design_params
    params.require(:design).permit(
      :genre_id,
      :design_name,
      :design_introduction,
      :design_price,
      images: [],
      items_attributes: [:id, :image, :design_id, :item_price, :stock, :is_active, :item_introduction,:item_type, :clone, :_destroy]
      )
  end

end

