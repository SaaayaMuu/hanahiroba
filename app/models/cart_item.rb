class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def subtotal
    item.with_tax_price * amount
  end

  def update_amount(num)
    update(amount: amount + num)
  end

end
