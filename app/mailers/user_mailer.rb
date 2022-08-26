class UserMailer < ApplicationMailer
  
  default from: 'notifications@example.com'
  
  def thanks_email
    @customer = params[:customer]
    
    @order_detail = current_customer.order_detail
    
    mail(to: @customer.email, subject: '<花広場>購入完了＊お支払い手続きをお願いします')
  end
end
