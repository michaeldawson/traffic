class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  after_create :sms_user

  def sms_user
    
  end
end
