class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @genre = Genre.all # headerの部分テンプレート用
    @cart_items = current_customer.cart_items.all
  end

  def create#既製品購入した場合のcreate
    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    if @cart_item.present?
      @cart_item.update_amount(params[:cart_item][:amount].to_i)# 1. 一度amountを更新(cart_item.ebにupdate_amountメソッド記述)
      if @cart_item.amount > @cart_item.item.stock # 2. もしamountがstockより多くなってしまったら
        @cart_item.update(amount: @cart_item.item.stock) # 3. amountをstockと同じ数し、再度update
        flash[:danger] = "※在庫数が足りません"
        redirect_to cart_items_path
      elsif @cart_item.amount <= @cart_item.item.stock # 2. もしamountがstockの数より少なければ問題ないので
        redirect_to cart_items_path # 3. そのままredirect
      end

		else
		  # @cart_item = CartItem.new(cart_item_params)
		  # @cart_item.customer_id = current_customer.id
		  # @cart_item.save
		  # ↑ の3行を省略したのが ↓ の1行
		  current_customer.cart_items.create(cart_item_params)
		  redirect_to cart_items_path
		end
  end

  def order_made_create#オーダーメイド商品購入した場合のcreate
    @item = Item.new(item_params)
    original_item = Item.find(params[:item][:original_item_id])
    @item.item_price = original_item.item_price
    @item.item_introduction = original_item.item_introduction
    @item.design_id = original_item.design_id
    @item.clone = true
    @item.is_active = true
    @item.stock = 10#同じ配色の商品を同時にいくつか購入可にするため
    @item.save
    @cart_item = CartItem.new
    @cart_item.amount = 1
    @cart_item.item_id = @item.id
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)# 1. 一度amountを更新

    if @cart_item.amount > @cart_item.item.stock # 2. もしamountがstockより多くなってしまったら
      @cart_item.update(amount: @cart_item.item.stock) # 3. amountをstockと同じ数し、再度update
      flash[:danger] = "※在庫数が足りません"
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

  def item_params
    params.require(:item).permit(:design_id, :item_introduction, :item_price ,:stock ,:is_active , :clone, :original_item_id, :image)
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :item_image)
  end

end