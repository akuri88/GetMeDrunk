class PromotionSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lon, :price, :date_begin, :time_begin,
            :date_expire, :time_expire, :product_name, :sponsored
end
