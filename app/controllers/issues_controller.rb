class IssuesController < ApplicationController
  def index
    @issues = Issue.where(issue_date: [(Date.today - 3.months) .. Date.tomorrow]).to_json
    render json: @issues
  end
end