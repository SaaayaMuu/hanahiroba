class Design < ApplicationRecord

  belongs_to :genre
  has_many :items, dependent: :destroy
  has_many_attached :images

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

    ## 消費税を求めるメソッド
  def with_tax_price
    (design_price*1.1).floor##(floorは端数切り捨てメソッド)
  end

end
