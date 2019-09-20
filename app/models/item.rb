class Item < ApplicationRecord
  belongs_to :menu
  has_and_belongs_to_many :orders
end
