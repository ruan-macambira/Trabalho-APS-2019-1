class HomeController < ApplicationController
  def index
    @latest_events = Event.latest(5)
  end

  def profile
    @user = current_user
    redirect_to root_path if @user.nil?
  end
end
