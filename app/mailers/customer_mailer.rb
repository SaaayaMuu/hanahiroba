class CustomerMailer < ApplicationMailer

  def thanks_email#(customer)
    @customer = params[:customer]

    @order = @customer.orders.last

    mail(to: @customer.email, subject: '<花広場>購入完了＊お支払い手続きをお願いします') #do |format|
      #format.text#テキストメールを指定
    #end
  end

end
