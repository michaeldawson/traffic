require 'rails_helper'

describe TweetService do
  context "with a new id and text" do
    before :each do
      @uid = "523068907867742208"
    end

    context "that's a retweet" do
      before :each do
        @text = "RT @Michael Hey man" 
        @tweet_service = TweetService.new(@uid, @text)
      end

      it "doesn't create a tweet entry" do
        expect {
          @tweet_service.process
        }.to_not change {
          TwitterEntry.count
        }
      end
    end

    context "that's not a retweet" do
      context "that has street names in it" do
        before :each do
          @text = "Enfield - Main North Rd near Regency Rd SB pretty slow #Adelaide"
          @tweet_service = TweetService.new(@uid, @text)
        end

        context "that's been processed" do
          before :each do
            TwitterEntry.create(uid: @uid)
          end

          it "doesn't create a new twitter entry" do
            expect {
              @tweet_service.process
            }.to_not change {
              TwitterEntry.count
            }
          end
        end

        context "that hasn't been processed" do
          it "creates a tweet entry" do
            expect {
              @tweet_service.process
            }.to change {
              TwitterEntry.count
            }.by(1)
          end

          it "assigns the suburb" do
            @tweet_service.process
            TwitterEntry.last.suburb.should eq "Enfield"
          end
        end
      end
    end
  end
end