class Review < ApplicationRecord

  has_one_attached :image

  belongs_to :customer
  belongs_to :design
end
