FactoryBot.define do
  factory :item do
    productname { '夢をかなえるゾウ' }
    explanation { '少し変わったゾウの神様がさまざまな助言を与えてくれるお話' }
    category_id { 5 }
    productstate_id { 3 }
    deliveryfee_id { 2 }
    region_id { 14 }
    deliverydate_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
