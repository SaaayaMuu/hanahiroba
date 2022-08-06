class Design < ApplicationRecord

  belongs_to :genre
  has_many :items, dependent: :destroy
  has_many_attached :images

  accepts_nested_attributes_for :items, allow_destroy: true
end
