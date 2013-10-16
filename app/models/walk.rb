class Walk < ActiveRecord::Base
  belongs_to :user
  #geocoded_by :address  # can also be an IP address
  #before_validation :geocode  # auto-fetch coordinates

  def address
    return self.address
  end
end
