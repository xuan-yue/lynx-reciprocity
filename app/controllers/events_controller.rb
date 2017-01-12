class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :attendees]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
   
  end

  def attendees
    @attendees = @event.users
  end

  def access 
    @event = Event.new
  end

  def validate_access
    @event = Event.where(["access_code = ? and 'endDate' >= ? ", params[:event][:access_code],Date.today])
    if !@event.empty?
      @attendance = AttendanceHistory.new(user: current_user, event: @event.first) 
      @attendance.save! if !AttendanceHistory.find_by(user: current_user, event: @event.first)
      redirect_to @event.first
    else
      flash[:danger] = 'Access code not found. Please contact your organizer.' 
      redirect_to events_path
    end

  end


  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
      @event.send_event_details
        format.html { flash[:success] = 'Event was successfully created.'
          redirect_to @event }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { flash[:danger] = 'Event could not be created.'
          render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { flash[:success] = 'Event was successfully updated.'
          redirect_to @event }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { flash[:danger] = 'Sorry, event could not be updated.'
          render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { flash[:success] = 'Event was successfully destroyed'
        redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :description, :user_id, :picture, :url, :startDate, :endDate)
    end
end
