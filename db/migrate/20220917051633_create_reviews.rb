class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|

      t.integer :customer_id, null: false
      t.integer :design_id, null: false
      t.float :rate, null: false, default: 0
      t.text :body, null: false

      t.timestamps
    end
  end
end
