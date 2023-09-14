require "test_helper"

class MenuTest < ActiveSupport::TestCase
  test "should save menu with name" do
    menu = Menu.new(name: "Rails Test Menu")

    assert menu.save
    assert_equal "Rails Test Menu", menu.name
  end

  test "should not save menu without name" do
    menu = Menu.new()

    assert_not menu.save, "Saved the menu without a name"
  end

  test "menus can have multiple menu items" do
    menu = Menu.new(name: "Rails Test Menu")
    menu_item_a = MenuItem.new(menu: menu, name: "Rails Test Menu Item A", price: 1.00)
    menu_item_b = MenuItem.new(menu: menu, name: "Rails Test Menu Item B", price: 2.00)

    menu.menu_items << menu_item_a
    menu.menu_items << menu_item_b

    assert menu.save
    assert_equal 2, menu.menu_items.count
    assert_equal "Rails Test Menu Item A", menu.menu_items[0].name
    assert_equal "Rails Test Menu Item B", menu.menu_items[1].name
  end
end
