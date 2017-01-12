class AttendanceHistoriesController < ApplicationController
  before_action :set_attendance_history, only: [:show, :edit, :update, :destroy]

  # GET /attendance_histories
  # GET /attendance_histories.json
  def index
    @attendance_histories = AttendanceHistory.all
  end

  # GET /attendance_histories/1
  # GET /attendance_histories/1.json
  def show
  end

  # GET /attendance_histories/new
  def new
    @attendance_history = AttendanceHistory.new
  end

  # GET /attendance_histories/1/edit
  def edit
  end

  # POST /attendance_histories
  # POST /attendance_histories.json
  def create
    @attendance_history = AttendanceHistory.new(attendance_history_params)

    respond_to do |format|
      if @attendance_history.save
        format.html { 
          flash[:success] = "Event Access Granted!"
          redirect_to @attendance_history.event }
        format.json { render @attendance_history.event, status: :created, location: @attendance_history }
      else
        format.html { 
          flash[:success] = "Sorry, check In failed!"
          redirect_to current_user }
        format.json { render json: @attendance_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendance_histories/1
  # PATCH/PUT /attendance_histories/1.json
  def update
    respond_to do |format|
      if @attendance_history.update(attendance_history_params)
        format.html { redirect_to @attendance_history, notice: 'Attendance History was successfully updated.' }
        format.json { render @attendance_history.event, status: :ok, location: @attendance_history }
      else
        format.html { render :edit }
        format.json { render json: @attendance_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_histories/1
  # DELETE /attendance_histories/1.json
  def destroy
    @attendance_history.destroy
    respond_to do |format|
      format.html { redirect_to attendance_histories_url, notice: 'Attendance History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_history
      @attendance_history = AttendanceHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_history_params
      params.require(:attendance_history).permit(:user_id, :event_id)
    end
end