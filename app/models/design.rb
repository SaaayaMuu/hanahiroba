class Design < ApplicationRecord

  belongs_to :genre
  has_many :items, dependent: :destroy
  has_many_attached :images
end
