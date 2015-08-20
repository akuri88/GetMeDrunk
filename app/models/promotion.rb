class Promotion < ActiveRecord::Base

  def self.search(params = {})
    return Promotion.all if params.blank?

    Promotion.where(params)
  end

end
