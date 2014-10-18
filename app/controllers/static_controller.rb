class StaticController < ApplicationController
  def index
    
  end

  def tweets
    @twitter_entries = Issue.all
  end
end
