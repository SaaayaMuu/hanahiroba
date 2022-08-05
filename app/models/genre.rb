class Genre < ApplicationRecord

  has_many :designs, dependent: :destroy

end
