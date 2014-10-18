class StaticController < ApplicationController
  def index
    @entries = Entry.all
  end

  def tweets
    @twitter_entries = TwitterEntry.all
  end
end
