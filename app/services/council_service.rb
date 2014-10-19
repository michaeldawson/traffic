class CouncilService
  attr_accessor :id, :title, :content, :issue_date
  def initialize id, title, content, issue_date
    self.id = id
    self.title = title
    self.content = content
    self.issue_date = issue_date
    puts issue_date
  end

  def process
    # Takes a council issue, parse it, and save an issue if it's interpretable

    road = /(\S+)\s(Rd|rd|Street|street|St|st|Lane|lane|Drive|drive|Dr|dr|Avenue|avenue|Av|av|Ave|Terrace|terrace|Tce|tce)/

    return if Issue.where(uid: "#{id}").first

    html_content = Nokogiri::HTML(content)
    html_content.xpath('//*[contains(@class,"label")]').each do |t|
      @parsed_location = t.next_element.text if t.text == "Location: "
      # @parsed_date = t.next_element.text if t.text == "When: "
    end
    
    # We try to extract a street name or something meaningful from the location, then use the full location as the description
    streets = @parsed_location.scan(road).map{|s| s.join(" ")}
    street = streets.first

    if @parsed_location && street

      puts "Added council-sourced issue: #{title} on #{issue_date}"

      issue = Issue.create(
        uid: id, 
        source: "council",
        original_text: content, 
        suburb: "#{street}, Adelaide", 
        description: title, 
        streets: streets.join(", "), 
        issue_date: issue_date
      )
    end
  end
end