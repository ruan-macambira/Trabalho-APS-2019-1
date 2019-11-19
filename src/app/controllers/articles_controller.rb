# frozen_string_literal: true

class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_event, except: :index
  before_action :set_article, only: %i[show edit update destroy assign apply]
  before_action :set_status, only: %i[show apply]

  def index
    @user = params[:user_id] || current_user
    @events = @user.events
    @statuses = Article.statuses_human.each_with_index
    @q = Article.ransack(params[:q])
    @articles = @q.result.where(user: @user)
  end

  def show
    @page_title = @article.title
    @professors = @event.professors if @article.awaiting?
  end

  def new
    @article = Article.new
  end

  def edit; end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to [@event, @article], notice: I18n.t('notices.articles.created')
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to [@event, @article], notice: I18n.t('notices.articles.updated')
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: I18n.t('notices.articles.destroyed')
  end

  def assign
    if @article.update(params.require(:article).permit(:user_ids))
      redirect_to [@event, @article], notice: I18n.t('notices.articles.assigned')
    else
      render :edit
    end
  end

  def apply
    if @article.update(params.require(:article).permit(:status))
      redirect_to [@event, @article], notice: I18n.t(@article.status, scope: 'notices.articles')
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id] || params[:article_id])
  end

  def set_status
    @status = %w[pending failed passed].map do |aux|
      [I18n.t(aux, scope: %i[activerecord enums article status]), aux]
    end
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def article_params
    params.require(:article).permit(
      :title, :abstract, :status, :user_id, :event_id, :pdf, :user_ids, :status,
      authors_attributes: %i[name email]
    )
  end
end
