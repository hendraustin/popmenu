class Menu < ApplicationRecord
    belongs_to :restaurant
    has_many :menu_items

    validates :name, presence: true
end
