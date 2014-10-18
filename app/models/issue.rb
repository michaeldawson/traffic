class Issue < ActiveRecord::Base
  after_validation :geocode
  geocoded_by :full_address

  def full_address
    "#{self.suburb}, SA"
  end

  def as_json(options)
    # this example DOES NOT ignore the user's options
    # super({:only => [:email, :handle]}.merge(options))

    {lat: latitude, lng: longitude, description: description.humanize}
  end
end