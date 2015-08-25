class Promotion < ActiveRecord::Base
  belongs_to :user
  validates :product_name, :user_id, :lat, :lon, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 },
                    presence: true

  def self.search(params = {})
    #Promotion.all 
    return Promotion.all if params.blank?
    return Promotion.where('product_name LIKE ?', "%#{params[:product_name]}%") if(params[:product_name])
  end

end
