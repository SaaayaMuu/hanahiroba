class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable



         validates :last_name, presence: { message: '未入力です' }
         validates :first_name, presence: { message: '未入力です' }
         validates :last_name_kana, presence: { message: '未入力です' }
         validates :first_name_kana, presence: { message: '未入力です' }
         validates :postal_code, presence: { message: '未入力です' }
         validates :address, presence: { message: '未入力です' }
         validates :telephone_number, presence: { message: '未入力です' }

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy

  def full_name
    last_name + ' ' + first_name
  end

end
