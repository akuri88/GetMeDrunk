class AddUserIndexForPromotions < ActiveRecord::Migration
  def change
    add_index :promotions, :user_id
  end
end
