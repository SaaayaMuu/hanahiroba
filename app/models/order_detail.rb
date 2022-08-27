class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { waiting_for_deposit: 0, deposit_confirmation: 1,
                        in_production: 2, production_completed: 3, shipped: 4 }
end
