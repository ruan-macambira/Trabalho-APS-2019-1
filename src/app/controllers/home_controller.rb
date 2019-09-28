class HomeController < ApplicationController
  def index
    @latest_events = Event.latest(5)
  end
end
