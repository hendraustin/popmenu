class MenuItem < ApplicationRecord
    belongs_to :menu

    validates :name, :price, presence: true
    validates_uniqueness_of :name, scope: :menu_id, message: "already exists in this menu"
end
