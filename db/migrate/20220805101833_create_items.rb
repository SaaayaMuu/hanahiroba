class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

     t.integer :design_id, null: false
     t.text :item_introduction , null: false
     t.integer :item_price, null: false
     t.integer :stock, null: false
     t.boolean :is_active, default: true, null: false

      t.timestamps
    end
  end
end
