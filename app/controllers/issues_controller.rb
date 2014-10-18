class IssuesController < ApplicationController
  def index
    @issues = Issue.where(issue_date: [(Date.today - 1.month) .. Date.tomorrow]).to_json
    render json: @issues
  end
end