class StaticController < ApplicationController
  def index
    redirect_to welcome_path if user_signed_in?
  end

  def welcome

  end

  def tweets
    @twitter_entries = Issue.all
  end
end
