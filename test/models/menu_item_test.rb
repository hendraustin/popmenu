require "test_helper"

class MenuItemTest < ActiveSupport::TestCase
  test "should save menu item with menu, name, and price" do
    restaurant = Restaurant.new(name: "Rails Test Restaurant")
    menu = Menu.new(restaurant: restaurant, name: "Rails Test Menu")
    menu_item = MenuItem.new(menu: menu, name: "Rails Test Menu Item", price: 1.00)

    assert menu.save
    assert menu_item.save
    assert_equal 1, menu.menu_items.count
    assert_equal "Rails Test Menu Item", menu.menu_items[0].name
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

  test "should not save menu item if name already exists in database" do
    menu = Menu.new(name: "Rails Test Menu")
    menu_item_a = MenuItem.new(menu: menu, name: "Rails Test Menu Item A", price: 1.00)
    menu_item_b = MenuItem.new(menu: menu, name: "Rails Test Menu Item A", price: 2.00)

    assert menu_item_a.save
    assert_not menu_item_b.save
  end
end
