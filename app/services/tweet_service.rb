class TweetService
  attr_accessor :id, :text
  def initialize id, text
    self.id = id
    self.text = text
  end

  def process
    # Takes a tweet id and text, checks if it exists, looks to see if it's alerting us of traffic issues, then saves it if that's the case
    rt = /RT/
    road = /(\S+)\s(Rd|rd|Street|street|St|st|Lane|lane|Drive|drive|Dr|dr|Avenue|avenue|Av|av|Ave|Tce|tce)/

    return if rt.match text
    return if TwitterEntry.where(id: id).first

    suburb = text.split("-").first.strip
    description = text.split("-").last.strip
    roads = text.scan(road)
    
    TwitterEntry.create(uid: id, original_text: text, suburb: suburb, description: description)
  end
end