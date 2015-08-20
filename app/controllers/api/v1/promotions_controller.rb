# Promotion Controller for API
class Api::V1::PromotionsController < ApplicationController
  #respond_to :json

  # /promotions
  # get(params)
  def index
    @promotions = Promotion.search(promotion_params)
    #respond_with @promotions
  end

  # /promotions/:id
  def show
  end

  # PUT PATCH /promotions/:id
  def update
  end

  private

  def promotion_params
    params.require(:promotion).permit(:lat, :lon, :product_name, :price,
                                      :date_begin, :time_begin, :date_expire,
                                      :time_expire)
  end
  # :lat :lon

  # :product_name # :product_type_id

  # :price

  # :date_begin :time_begin :date_expire :time_expire

end
