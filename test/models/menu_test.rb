require "test_helper"

class MenuTest < ActiveSupport::TestCase
  test "should save menu with restaurant and name" do
    restaurant = Restaurant.new(name: "Rails Test Restaurant")
    menu = Menu.new(restaurant: restaurant, name: "Rails Test Menu")

    assert menu.save
    assert 1, restaurant.menus.count
    assert_equal "Rails Test Menu", restaurant.menus[0].name
  end

  test "should not save menu without restaurant" do
    menu = Menu.new(name: "Rails Test Menu")

    assert_not menu.save, "Saved  the menu without a restaurant"
  end

  test "should not save menu without name" do
    restaurant = Restaurant.new(name: "Rails Test Restaurant")
    menu = Menu.new(restaurant: restaurant)

    assert_not menu.save, "Saved the menu without a name"
  end

  test "should not save menu without restaurant and name" do
    menu = Menu.new()

    assert_not menu.save, "Saved the menu without a restaurant and name"
  end

  test "menus can have multiple menu items" do
    restaurant = Restaurant.new(name:  "Rails Test Restaurant")
    menu = Menu.new(restaurant: restaurant, name: "Rails Test Menu")
    menu_item_a = MenuItem.new(menu: menu, name: "Rails Test Menu Item A", price: 1.00)
    menu_item_b = MenuItem.new(menu: menu, name: "Rails Test Menu Item B", price: 2.00)

    menu.menu_items << menu_item_a
    menu.menu_items << menu_item_b

    assert menu.save
    assert 1, restaurant.menus.count
    assert_equal 2, menu.menu_items.count
    assert_equal "Rails Test Menu Item A", restaurant.menus[0].menu_items[0].name
    assert_equal "Rails Test Menu Item B", restaurant.menus[0].menu_items[1].name
  end
end
