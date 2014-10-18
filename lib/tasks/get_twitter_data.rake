task :get_twitter_data => :environment do
  # Get tweets from @NickGreenATN and parse for traffic issues

  twitter_client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "te22DL5rlF2B7i9MQi5rRuhsq"
    config.consumer_secret     = "rHUANJbxCl603pN4LwWz3GeWkdW8YKq8L4oPJGGfaoYTVHW7nz"
    config.access_token        = "281278165-jSTCPVXWCEW0EdsyOdV7tdpLxRPHah5cjqAoNIXy"
    config.access_token_secret = "CA6bbVCemU6ZpJV8BPGi6E34bXriltCKzt2WFwnsx52QJ"
  end

  tweets = twitter_client.user_timeline("NickGreenATN")

  tweets.each do |tweet|
    TweetService.new tweet.id, tweet.full_text
  end
end