module Facebook
  def find_for_facebook_oauth(auth, signed_in_resource=nil)
    # Find user based on provider and uid
    instance = self.where(:provider => auth.provider, :uid => auth.uid).first

    # Find user based on email
    unless instance
      instance = self.where(email: auth.info.email).first
    end

    # Create a new user
    unless instance
    instance = self.create( first_name:auth.extra.raw_info.first_name,
                            last_name:auth.extra.raw_info.last_name,
                            age: (auth.extra.raw_info.birthday.blank? ? nil : (Date.today-Date.strptime(auth.extra.raw_info.birthday, "%m/%d/%Y")).to_i / 361),
                            location: (auth.extra.raw_info.location.blank? ? nil : auth.extra.raw_info.location["name"]),
                            gender: auth.extra.raw_info.gender,
                            provider:auth.provider,
                            uid:auth.uid,
                            email:auth.info.email,
                            password:Devise.friendly_token[0,20],
                            oauth_token: auth.credentials.token,
                            oauth_expires_at: Time.at(auth.credentials.expires_at)
                        )
    end
    instance
  end
end