FactoryGirl.define do
  factory :promotion do
    lat '-12345678.232342' # { FFaker::Internet.email }
    lon '12345678.232342'
    price { rand() * 100 }
    date_begin '20150101'
    time_begin '19900101 12:00:00'
    date_expire '20150101'
    time_expire '19900101 12:00:00'
    product_name 'alcohol' # { FFaker::Promotion.product_name }
    user
  end
end
