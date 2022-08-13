class Design < ApplicationRecord

  belongs_to :genre
  has_many :items, dependent: :destroy
  has_many_attached :images

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true


end
