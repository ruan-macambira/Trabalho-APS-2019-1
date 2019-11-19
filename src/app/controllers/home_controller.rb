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
    @pending = Article.where(status: :pending).select {|x| x.proofreader == current_user }
    @articles = Article.where.not(status: :pending).select {|x| x.proofreader == current_user }
  end
end
