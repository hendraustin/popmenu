require 'json'

namespace :import_data do
    desc "Import data from JSON file"
    task :from_json, [:file_path] => :environment do |_, args|
        file_path = args[:file_path]
        json_data = JSON.parse(File.read(file_path))
        begin
            json_data["restaurants"].each do |restaurant|
                curr_restaurant = Restaurant.create(name: restaurant["name"])

                restaurant["menus"].each do |menu|
                    curr_menu = Menu.create(restaurant: curr_restaurant, name: menu["name"])

                    # Transform incorrectly named keys in given data
                    menu.transform_keys! { |key| key != "menu_items" ? "menu_items" : key }

                    menu["menu_items"].each do |menu_item|
                        menu_item_name = menu_item["name"].gsub("\"", "")
                        curr_menu_item = MenuItem.create(name: menu_item_name, price: menu_item["price"])

                        # Check if MenuItem already exists (based on both name and price)
                        if !MenuItem.exists?(name: curr_menu_item.name, price: curr_menu_item.price)
                            if curr_menu.menu_items << curr_menu_item
                                puts "Item created for #{curr_restaurant.name} on the #{curr_menu.name} menu, #{curr_menu_item.name}, price: #{curr_menu_item.price}"
                            end
                        else
                            puts "Failure: #{curr_menu_item.name} with a price of #{curr_menu_item.price} already stored"
                        end
                    end
                end
            end

        # Catch any outliers not transformed in loop
        rescue NoMethodError => exception
            puts "Unexpected error with json keys: #{exception} on #{exception.backtrace[0]}"
        end
    end
end
