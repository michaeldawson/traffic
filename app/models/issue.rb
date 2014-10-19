class Issue < ActiveRecord::Base
  after_validation :geocode
  geocoded_by :full_address

  after_create :notify_users

  def full_address
    "#{self.suburb}, SA"
  end

  def as_json(options)
    # this example DOES NOT ignore the user's options
    # super({:only => [:email, :handle]}.merge(options))

    {lat: latitude, lng: longitude, description: description.humanize, issue_date: issue_date.strftime("%d %b")}
  end

  def notify_users
    User.all.each do |user|
      Notification.create(issue: self, user: user)
    end
  end
end