class Promotion < ActiveRecord::Base
  belongs_to :user

  def self.search(params = {})
    return Promotion.all if params.blank?
    return Promotion.where('product_name LIKE ?', "%#{params[:name]}%") if(params[:name])
    return Promotion.where('product_name LIKE ?', "%#{params[:lat]}%") if(params[:lat])
    return Promotion.where('product_name LIKE ?', "%#{params[:name]}%") if(params[:price])
    return Promotion.where('product_name LIKE ?', "%#{params[:name]}%") if(params[:lon])
    return Promotion.where('product_name LIKE ?', "%#{params[:name]}%") if(params[:time])
  end

end
