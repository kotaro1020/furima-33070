class PayForm
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :postalcode, :region_id, :municipality, :address, :buildingname, :phonenumber, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :municipality
    validates :address
    validates :token
    validates :postalcode
    validates :phonenumber
  end
  
    validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :region_id, numericality: { other_than: 1}
    validates :phonenumber, format: { with: /\A\d{11}\z/}

    def save
      product_record = ProductRecord.create(user_id: user_id, item_id: item_id)
      shipping_address = ShippingAddress.create(postalcode: postalcode, region_id: region_id, municipality: municipality, address: address, phonenumber: phonenumber, buildingname: buildingname, product_record_id: product_record.id)
    end
end 