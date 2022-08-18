class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :design
  has_many :cart_items

  ## 消費税を求めるメソッド
  def with_tax_price
    (item_price*1.1).floor##(floorは端数切り捨てメソッド)
  end

end
