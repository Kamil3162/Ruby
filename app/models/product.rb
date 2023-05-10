class Product < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :category
  has_many :order_items
end
