class ArticlesController < ApplicationController
  before_action :set_event, except: :index
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_status, only: %i[show apply]
  before_action :authenticate_user!, except: %i[index show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      Notification.create(
        user: current_user, message: I18n.t('message.article.awaiting', article: @article.title)
      )
      redirect_to [@event, @article], notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if @article.update(article_params)
      if @article.awaiting? && @article.proofreader.present?
        @article.pending!
        Notification.create!(
          user: current_user,
          message: I18n.t('message.article.pending', article: @article.title)
        )
      end
      if @article.passed? || @article.failed?
        Notification.create!(
          user: current_user,
          message: I18n.t(@article.status, scope: %i[message article], article: @article.title)
        )
      end
      redirect_to [@event, @article], notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  def assign_revisor
    @article = Article.find(params[:article_id])
    @professors = @event.professors
  end

  def apply
    @article = Article.find(params[:article_id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def article_params
    params.require(:article).permit(
      :title, :abstract, :status, :user_id, :event_id, :pdf, :user_ids, :status,
      authors_attributes: %i[name email]
    )
  end

  def set_status
    @status = ['pending', 'failed', 'passed'].map { |aux|
      [I18n.t(aux, scope: [:activerecord, :enums, :article, :status]), aux]
    }
  end

  def set_event
    @event = Event.find(params[:event_id])
  end
end
