class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @genre = Genre.all # headerの部分テンプレート用
    @customer = current_customer
  end

  def edit
    @genre = Genre.all # headerの部分テンプレート用
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  private

  def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email,
                                   :postal_code, :address, :telephone_number)
  end

end
