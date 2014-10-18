class StaticController < ApplicationController
  def index
    @entries = Entry.all
  end

  def tweets
    @twitter_entries = Issue.all
  end
end
