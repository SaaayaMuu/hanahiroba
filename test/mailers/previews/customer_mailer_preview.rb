# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  def thanks_email
    CustomerMailer.with(customer: Customer.first).thanks_email
  end

end
