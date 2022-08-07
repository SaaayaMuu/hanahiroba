class Public::CustomerController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def unsubscribe
  end
end
