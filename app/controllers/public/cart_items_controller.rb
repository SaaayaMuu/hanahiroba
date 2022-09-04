class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @genre = Genre.all # headerの部分テンプレート用
    @cart_items = current_customer.cart_items.all
  end

  def create
    @genre = Genre.all # headerの部分テンプレート用(render用)
    @cart_items = current_customer.cart_items.all #render用
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      if params[:cart_item][:amount].to_i >= @cart_item.item.stock #if カート内商品のamountが商品のstockを上回ったら
        flash.now[:notice] = "※在庫数が足りません"
        render :index
      else
        @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)
        redirect_to cart_items_path
      end
		else
		  @cart_item = CartItem.new(cart_item_params)
		  @cart_item.customer_id = current_customer.id
		  @cart_item.save
		  redirect_to cart_items_path
		end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.amount >= @cart_item.item.stock #if カート内商品のamountが商品のstockを上回ったら
      flash[:notice] = "※在庫数が足りません"
      redirect_to cart_items_path
    else
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :item_image)
  end

end