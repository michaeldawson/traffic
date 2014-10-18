require 'rails_helper'

describe IssuesController do
  describe "GET index" do
    context "with issues in the db" do
      before :each do
        FactoryGirl.create(:issue, suburb: "Adelaide")
      end

      it "returns the right format data" do
        xhr :get, :index, {}
        json = JSON.parse(response.body)

        assert json.count > 0
        # response.body.
      end
    end
  end
end