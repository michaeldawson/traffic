require 'rails_helper'

describe CouncilService do
  context "with a new id and content" do
    before :each do
      @uid = "523068907867742208"
    end

    context "that includes a valid location" do
      before :each do
        @content = '\n\t\t\t\t\t\n\t      \t\t\n<div class=\"row\">\n\t\t\t\t\t\t<span class=\"label\">Location: </span><span class=\"value\"><p>Various places surrounding North Terrace.<a href=\"http://stage.accmaps.bl.ms/common/dm/assets/Adelaide_Oval_2014_Event_Parking_Restriction_Timetable_-_2_October_2014.pdf\">Click here</a> for more information.</p>\n</span>\n<div style=\"clear: both;\"></div>\n</div>\n<div style=\"clear: both;\"></div>\n<!-- .row -->\n\t\t\t\n<div class=\"row\">\n\t\t\t\t\t\t<span class=\"label\">When: </span><span class=\"value\"><p>Friday 17 October 2014 for Adelaide United A League match</p>\n<p>Saturday 25 October 2014 for the Rolling Stones concert</p>\n</span>\n<div style=\"clear: both;\"></div>\n</div>\n<div style=\"clear: both;\"></div>\n<!-- .row -->\n\t\t\t\n\t\t\t\t<div class=\"row last-updated\"><span class=\"value\">Last updated 13 October 2014 11:40 am</span></div>\n\t'
        @council_service = CouncilService.new(@uid, @content, DateTime.yesterday)
      end

      it "parses the location" do
        @council_service.process
        Issue.last.suburb.should eq 'North Terrace, Adelaide'
      end

      it "parses the description" do
        @council_service.process
        Issue.last.description.should eq 'North Terrace, Adelaide'
      end
    end
  end
end