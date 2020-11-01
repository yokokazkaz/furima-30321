class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,              null: false
      t.text    :detail,            null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :delivery_fee_id ,  null: false
      t.integer :shipping_area_id , null: false
      t.integer :shipping_days_id , null: false
      t.integer :price,             null: false
      t.timestamps
    end
  end
end
