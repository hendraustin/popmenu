class MenuItem < ApplicationRecord
    belongs_to :menu

    validates :name, :price, presence: true
    validates_uniqueness_of :name
end
