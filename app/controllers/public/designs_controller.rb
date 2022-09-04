class Public::DesignsController < ApplicationController
  def index
    @genre = Genre.all # headerの部分テンプレート用
    @designs = Design.all
    if params[:genre_id].present?
      @genre1 = Genre.find(params[:genre_id])
      @designs = @genre1.designs
    end
  end

  def show
    @genre = Genre.all # headerの部分テンプレート用
    @design = Design.find(params[:id])
    @items = @design.items.all
    @cart_item = CartItem.new
  end
end
