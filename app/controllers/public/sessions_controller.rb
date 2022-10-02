# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  before_action :customer_state, only: [:create]
  before_action :cartitems_destroy, only: [:destroy]

  def after_sign_in_path_for(resource)
    flash[:notice] = '' #(nav部分に常時顧客名表示してるのでいらない)
    designs_path
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = 'ログアウトしました'
    designs_path
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected
  # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == true)
      flash[:notice] = 'すでに退会しています。再度会員登録をしてください。'
      redirect_to new_customer_registration_path
    end
  end

  #ログアウト時にcart_itemの中身をすべて空にする
  def cartitems_destroy
    @customer = current_customer
    @cart_items = @customer.cart_items.all
    @cart_items.destroy_all
  end

end
