
task :get_council_data => :environment do 

  urls = %w[http://smartmoveadelaide.com.au/ajax/get_traffic_rss]
  feeds = Feedjira::Feed.fetch_and_parse urls
  feed = feeds.first

  feed[1].entries.each do |entry|
    new_entry = Entry.find_or_initialize_by(uid: entry.id)
    new_entry.title = entry.title
    new_entry.summary = entry.summary

    new_entry.save
  end
end