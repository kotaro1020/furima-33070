class ProductRecord < ApplicationRecord
  belongs_to :item
  has_one    :shipping_address
end
