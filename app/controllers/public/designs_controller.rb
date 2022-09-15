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
    # @item = @design.items.find(params[:id])
    # @items.update(item_params)
    if @design.design_type == true #もしデザインタイプが”既製品だったら”
      @items = @design.items.all
      @cart_item = CartItem.new#(既製品)
    else
      # @item = @design.items.first
      @item = Item.new#(オーダー－メイド商品用)
      @item = @design.items.first
    end
  end

  # def update
  #   @item = Item.where(design_name: "オーダーメイドイヤリング")
  #   @item.update(item_params)
  # end

  # private

  # def item_params
  #   params.permit(custom_images: [])
  # end
end