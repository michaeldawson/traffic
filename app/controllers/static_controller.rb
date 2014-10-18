class StaticController < ApplicationController
  def index
    @entries = Entry.all
  end
end
