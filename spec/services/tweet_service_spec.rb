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
          Issue.count
        }
      end
    end

    context "that's not a retweet" do
      context "without a suburb" do
        before :each do
          @text = "Main North Rd near Regency Rd SB pretty slow #Adelaide"
          @tweet_service = TweetService.new(@uid, @text)
        end

        it "doesn't create a new twitter entry" do
          expect {
            @tweet_service.process
          }.to_not change {
            Issue.count
          }
        end
      end

      context "that has a suburb and street names in it" do
        before :each do
          @text = "Enfield - Main North Rd near Regency Rd SB pretty slow #Adelaide"
          @tweet_service = TweetService.new(@uid, @text)
        end

        context "that's been processed" do
          before :each do
            Issue.create(uid: @uid)
          end

          it "doesn't create a new twitter entry" do
            expect {
              @tweet_service.process
            }.to_not change {
              Issue.count
            }
          end
        end

        context "that hasn't been processed" do
          it "creates a tweet entry" do
            expect {
              @tweet_service.process
            }.to change {
              Issue.count
            }.by(1)
          end

          it "assigns the suburb" do
            @tweet_service.process
            Issue.last.suburb.should eq "Enfield"
          end
        end
      end
    end
  end
end