class AddMenuToMenuItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :menu_items, :menu
    add_foreign_key :menu_items, :menus
  end
end
