class HomeController < ApplicationController
  def index
    @latest_events = Event.latest(5)
  end

  def profile
    @user = current_user
    redirect_to root_path if @user.nil?
  end

  def proofreadings
    unless user_signed_in? && current_user.professor?
      redirect_to root_path
      return
    end
    @pending = Article.where(user: current_user).where(status: :pending)
    @articles = Article.where(user: current_user).where.not(status: :pending)
  end
end
