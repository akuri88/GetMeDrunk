class Promotion < ActiveRecord::Base
  belongs_to :user
  validates :product_name, :lat, :lon, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true

  def self.search(params = {})
    # Promotion.all 
    # return Promotion.all if params.blank?
    # Searchs by Product Name
    return Promotion.where('product_name LIKE ?', "%#{params[:product_name]}%", params[:lon], params[:lat]) if(params[:product_name])
    # Search by Price Range
    return Promotion.where('price >= ? AND price <= ?', params[:low_price], params[:top_price, params[:lon], params[:lat]]) if(params[:low_price])
    
    # Search by Lat and Lon
    return Promotion.where('product_type_id = ?', params[:product_type_id], params[:lon], params[:lat]) if(params[:product_type_id])
    # Search by Date/Time
    return Promotion.where('price >= ? AND price <= ?', params[:low_price], params[:top_price], params[:lon], params[:lat]) if(params[:low_price])
  end

end
