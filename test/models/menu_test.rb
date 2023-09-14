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
end
