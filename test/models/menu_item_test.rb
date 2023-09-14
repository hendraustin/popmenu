require "test_helper"

class MenuItemTest < ActiveSupport::TestCase
  test "should save menu item with menu, name, and price" do
    menu = Menu.new(name: "Rails Test Menu")
    menu_item = MenuItem.new(menu: menu, name: "Rails Test Menu Item", price: 1.00)

    assert menu_item.save
    assert 1, menu.menu_items.count
  end

  test "should not save menu item without menu" do
    menu_item = MenuItem.new(name: "Rails Test Menu Item", price: 1.00)

    assert_not menu_item.save, "Saved the menu item without menu"
  end

  test "should not save menu item without name" do
    menu = Menu.new(name: "Rails Test Menu")
    menu_item = MenuItem.new(menu: menu, price: 1.00)

    assert_not menu_item.save
  end

  test "should not save menu item without price" do
    menu = Menu.new(name: "Rails Test Menu")
    menu_item = MenuItem.new(menu: menu, name: "Rails Test Menu Item")

    assert_not menu_item.save
  end

  test "should not save menu item without name and price" do
    menu_item = MenuItem.new()

    assert_not menu_item.save, "Saved the menu without a name and price"
  end
end
