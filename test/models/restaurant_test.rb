require "test_helper"

class RestaurantTest < ActiveSupport::TestCase
  test "should save restaurant with name" do
    restaurant = Restaurant.new(name: "Rails Test Restaurant")

    assert restaurant.save
    assert_equal "Rails Test Restaurant", restaurant.name
  end

  test "should not save restaurant without name" do
    restaurant = Restaurant.new()

    assert_not restaurant.save, "Saved the restaurant without a name"
  end

  test "restaurants can have multiple menus" do
    restaurant = Restaurant.new(name: "Rails Test Restaurant")
    menu_a = restaurant.menus.new(name: "Rails Test Menu A")
    menu_b = restaurant.menus.new(name: "Rails Test Menu B")

    assert restaurant.save
    assert menu_a.save
    assert menu_b.save
    assert_equal 2, restaurant.menus.count
  end
end
