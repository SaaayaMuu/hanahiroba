class Admin::DesignsController < ApplicationController
  
  def index
  end

  def new
    @design = Design.new
    @item = Item.new

  end

  def create
    @design = Design.new(design_params)
    @item = Item.new(item_params)
  end

  def show
  end

  def edit
  end

  private

  def design_params
    params.require(:design).permit(:genre_id, :design_name, :design_introduction, :design_price, images: [])
  end

  def item_params
    params.require(:item).permit(:design_id, :item_introduction, :item_price, :stock, :is_active)
  end
end
