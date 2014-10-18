class IssuesController < ApplicationController
  def index
    @issues = Issue.all.to_json

    render json: @issues
  end
end