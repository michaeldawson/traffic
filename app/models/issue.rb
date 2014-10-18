class Issue < ActiveRecord::Base
  after_validation :geocode
  geocoded_by :full_address

  def full_address
    "#{self.suburb}, SA"
  end
end