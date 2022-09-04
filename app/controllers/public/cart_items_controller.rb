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
      @cart_item.update(amount: @cart_item.amount + params[:cart_item][:amount].to_i)# 1. 一度amountを更新

      if @cart_item.amount > @cart_item.item.stock # 2. もしamountがstockより多くなってしまったら
        @cart_item.update(amount: @cart_item.item.stock) # 3. amountをstockと同じ数し、再度update
        flash[:notice] = "※在庫数が足りません"
        redirect_to cart_items_path
      elsif @cart_item.amount <= @cart_item.item.stock # 2. もしamountがstockの数より少なければ問題ないので
        redirect_to cart_items_path # 3. そのままredirect
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
    @cart_item.update(cart_item_params)# 1. 一度amountを更新
    if @cart_item.amount > @cart_item.item.stock # 2. もしamountがstockより多くなってしまったら
      @cart_item.update(amount: @cart_item.item.stock) # 3. amountをstockと同じ数し、再度update
      flash[:notice] = "※在庫数が足りません"
      redirect_to cart_items_path
    elsif @cart_item.amount <= @cart_item.item.stock # 2. もしamountがstockの数より少なければ問題ないので
      redirect_to cart_items_path # 3. そのままredirect
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