class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.float :lat
      t.float :lon
      t.integer :price
      t.date :date_begin
      t.integer :time_begin
      t.date :date_expire
      t.integer :time_expire
      t.string :product_name
      t.integer :report_counter
      t.integer :sponsored
      t.integer :activated

      t.timestamps null: false
    end
  end
end
