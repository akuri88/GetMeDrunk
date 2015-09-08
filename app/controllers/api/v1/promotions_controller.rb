# Promotion Controller for API
class Api::V1::PromotionsController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  respond_to :json


  # /promotions
  # get(params)
  def index
    @promotions = Promotion.search(search_params)
    #respond_with @promotions
    render json: @promotions
  end

  # /promotions/:id
  def show
    respond_with Promotion.find(params[:id])
  end

  def create
    promotion = current_user.promotions.new(save_params) 
    if promotion.save
      render json: promotion, status: 201
    else
      render json: { errors: promotion.errors }, status: 422
    end
  end

  # PUT PATCH /promotions/:id
  def update
    promotion = current_user.promotions.find(params[:id])
    if promotion.update(promotion_params)
      render json: promotion, status: 200, location: [:api, promotion]
    else
      render json: { errors: promotion.errors }, status: 422
    end
  end

  def destroy
    promotion = current_user.promotions.find(params[:id])
    promotion.destroy
    head 204
  end

  private

  def search_params
    params.require(:promotion).permit(:lat, :lon, :product_name,
                                      :low_price, :top_price,
                                      :date, :time, :product_type)
  end

  def save_params
    params.require(:promotion).permit(:lat, :lon, :product_name, :price,
                                      :date_begin, :time_begin, :date_expire,
                                      :time_expire, :product_type)
  end
  # :lat :lon

  # :product_name # :product_type_id

  # :price

  # :date_begin :time_begin :date_expire :time_expire

end
