class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!

  def new
    @genre = Genre.all # headerの部分テンプレート用
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @genre = Genre.all # headerの部分テンプレート用
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @select_address = params[:order][:select_address]#　←ここで定義したselect_addressをconfirmのfidden_fieldでcreateアクションに送信
    if params[:order][:select_address] == "0"#ご自身の住所を選んだ場合
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:order][:select_address] == "1"#過去のお届け先履歴から選択を選んだ場合
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2"#新しいお届け先を選んだ場合
      @order.postal_code = @order.postal_code
      @order.address = @order.address
      @order.name = @order.name
    else
      flash[:error] = '情報を正しく入力して下さい。'
      render :new
    end
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      if params[:order][:select_address] == "2"#新しいお届け先を入力した場合のみ、Addressテーブルに保存
        @address = Address.new
        @address.postal_code = @order.postal_code
        @address.address = @order.address
        @address.name = @order.name
        @address.customer_id = current_customer.id
        @address.save
      end

      @cart_items = current_customer.cart_items
      # @item.stock = current_customer.cart_items.item.stock
      @cart_items.each do |cart_item|

        # カートアイテム情報の取得＆注文詳細テーブルへ保存 #
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item_id
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.amount =  cart_item.amount

        # 商品在庫カラムの変更
        @stock_number = cart_item.item.stock - cart_item.amount
        # ↓ @item.updateのための@itemの中身を定義(Item.find(cart_item.item_id)でレコードを特定)
        @item =  Item.find(cart_item.item_id)
        @item.update(stock: @stock_number)

        # ↓　注文詳細が保存されたらthanksメールを送信
        if @order_detail.save
          CustomerMailer.with(customer: @customer).thanks_email.deliver_later#thanks_email(@customer).deliver_now
        else
          redirect_to cart_items_path
        end
      end
      @cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      redirect_to cart_items_path
    end
  end

  def thanks
    @genre = Genre.all # headerの部分テンプレート用
  end

  def index
    @genre = Genre.all # headerの部分テンプレート用
    @customer = current_customer
    @orders = @customer.orders.all.order(created_at: :desc)
  end

  def show
    @genre = Genre.all # headerの部分テンプレート用
    @order = Order.find(params[:id])
    #@order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.all
  end

  private


  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :postage, :total_price, :payment_method, :making_status)
  end

  def address_params
    params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

  def item_params
    params.require(:item).permit(:stock)
  end


end
