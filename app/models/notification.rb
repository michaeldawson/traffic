class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :issue

  validates_presence_of :issue, :user

  after_create :sms_user

  def sms_user
    require 'smsglobal'
    sender = SmsGlobal::Sender.new :user => '92lrp5ps', password: 'd3YwQQVz'

    text = "Traffic issue in #{self.issue.suburb}: #{self.issue.description.strip}. \n"
    text = text + "By the way - heard of EasyFuel? Save 10, 20, 30c/L off petrol and more!"

    sender.send_text text, self.user.mobile, '0435129029'
  end
end