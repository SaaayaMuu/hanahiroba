class Address < ApplicationRecord

  belongs_to :customer


  #注文情報入力画面(orders#new)での登録済み住所のセレクトBOXで使用
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

end
