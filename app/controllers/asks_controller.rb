class AsksController < ApplicationController
  before_action :set_ask, only: [:show, :edit, :update, :destroy]
  #before_action :set_event, only: [ :edit, :new]

  # GET /asks
  # GET /asks.json
  def index
    @asks = Ask.all
  end

  # GET /asks/1
  # GET /asks/1.json
  def show
    responses = @ask.responses.paginate(page: params[:page])
  end

  # GET /asks/new
  def new
    @ask = Ask.new(event_id: params[:event_id])
  end

  # GET /asks/1/edit
  def edit
  end

  # POST /asks
  # POST /asks.json
  def create
    @ask = Ask.new(ask_params)

    respond_to do |format|
      if @ask.save
        format.html { flash[:success] =  'Ask was successfully created.'
         redirect_to @ask.event }
        format.json { redirect_to @ask.event, status: :created, location: @ask }
      else
        format.html { flash[:danger] = 'Sorry, the ask could not be created.'
          redirect_to @ask.event }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asks/1
  # PATCH/PUT /asks/1.json
  def update
    respond_to do |format|
      if @ask.update(ask_params)
        format.html { redirect_to @ask, notice: 'Ask was successfully updated.' }
        format.json { render :show, status: :ok, location: @ask }
      else
        format.html { render :edit }
        format.json { render json: @ask.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asks/1
  # DELETE /asks/1.json
  def destroy
    @ask.destroy
    respond_to do |format|
      format.html { redirect_to asks_url, notice: 'Ask was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ask
      @ask = Ask.find(params[:id])
    end
    def set_event
      @event = Event.find(params[:event_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def ask_params
      params.require(:ask).permit(:user_id, :event_id, :ask, :details)
    end
end
