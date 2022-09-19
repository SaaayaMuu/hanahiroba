class CustomerMailer < ApplicationMailer

  # ↓　差出人アドレスに名前をつける場合の書き方
  default from: email_address_with_name('notification@example.com', '花広場')


  def thanks_email(customer)
    @customer = customer
    @order = @customer.orders.last
    mail(to: @customer.email, subject: '<花広場>購入完了＊お支払い手続きをお願いします') do |format|
      format.text#テキストメールを指定
    end
  end

end
