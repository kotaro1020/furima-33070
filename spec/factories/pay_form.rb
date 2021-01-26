FactoryBot.define do
  factory :pay_form do
    postalcode {"123-4567"}
    region_id {3}
    municipality {"大宮市"}
    address {"大門町1-1-1"}
    buildingname {"柳ビル103"}
    phonenumber {"09023456789"}
    token {"sk_test_db4cd1995cfef7641e80afbb"}
    association :user
    association :item
  end
end
