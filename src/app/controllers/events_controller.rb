class EventsController < ApplicationController
  before_action :set_foreign, only: %i[new create edit update]
  before_action :set_event, only: %i[show edit update destroy]

  # GET /events
  # GET /events.json
  def index
    set_status
    @keywords = Keyword.all
    @q = Event.ransack(params[:q])
    @events = @q.result.includes(:keywords)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    if user_signed_in? && current_user.admin?
      @articles = Article.where(event: @event)
    else
      @articles = Article.where(event: @event).passed
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  def field_professors
    render json: Professor
      .search_by_field(params[:field_id])
      .select(:id, :name)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def set_foreign
    @keywords = Keyword.all
    @fields = Field.all
  end

  def set_status
    @status = ['awaiting', 'opened', 'closed'].map { |aux|
      [I18n.t(aux, scope: [:activerecord, :enums, :event, :status]), aux]
    }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(
      :name, :initials, :event_start, :event_finish,
      :submission_start, :submission_finish, :field_id,
      keyword_ids: [], professor_ids: []
    )
  end
end
