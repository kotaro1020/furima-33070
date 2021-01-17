class Item < ApplicationRecord
  belongs_to :user
  has_one    :product_record
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :productname
    validates :explanation
    validates  :price, numericality: { only_integer: true,
      greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
      }
  end
    

   with_options numericality: { other_than: 1 } do
   validates :category_id
   validates :productstate_id
   validates :deliveryfee_id
   validates :region_id
   validates :deliverydate_id
   end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :productstate
  belongs_to :deliveryfee
  belongs_to :region
  belongs_to :deliverydate
end