class AddRestaurantToMenus < ActiveRecord::Migration[7.0]
  def change
    add_reference :menus, :restaurant
    add_foreign_key :menus, :restaurants
  end
end
