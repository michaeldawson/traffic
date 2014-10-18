
task :get_council_data => :environment do 

  urls = %w[http://smartmoveadelaide.com.au/ajax/get_traffic_rss]
  feeds = Feedjira::Feed.fetch_and_parse urls
  feed = feeds.first

  feed[1].entries.each do |entry|
    (CouncilService.new(entry.id, entry.title, entry.summary, entry.published)).process
  end
end