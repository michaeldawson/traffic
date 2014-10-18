class StaticController < ApplicationController
  def index
    @entries = Entry.all
  end

  def tweets
    twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "te22DL5rlF2B7i9MQi5rRuhsq"
      config.consumer_secret     = "rHUANJbxCl603pN4LwWz3GeWkdW8YKq8L4oPJGGfaoYTVHW7nz"
      config.access_token        = "281278165-jSTCPVXWCEW0EdsyOdV7tdpLxRPHah5cjqAoNIXy"
      config.access_token_secret = "CA6bbVCemU6ZpJV8BPGi6E34bXriltCKzt2WFwnsx52QJ"
    end

    @tweets = twitter_client.user_timeline("NickGreenATN")
  end
end
