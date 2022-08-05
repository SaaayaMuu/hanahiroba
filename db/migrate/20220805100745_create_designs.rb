class CreateDesigns < ActiveRecord::Migration[6.1]
  def change
    create_table :designs do |t|
      
     t.integer :genre_id, null: false
     t.string :design_name, null: false
     t.text :design_introduction , null: false
     t.integer :price, null: false
     
     
      t.timestamps
    end
  end
end
