class TrainSchedulesController < ApplicationController
  before_action :set_train_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:index]

  # GET /train_schedules
  # GET /train_schedules.json
  def index
    train_source = params[:source] || 'San Francisco'
    @train_schedules_by_day = {}
    ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'].each do |day|
      @train_schedules_by_day[day.to_sym] = TrainSchedule.where("days like '%#{day}%'").where({departs: train_source})
    end
  end

  # GET /train_schedules/1
  # GET /train_schedules/1.json
  def show
  end

  # GET /train_schedules/new
  def new
    # using all because for now db size is small, as it grows recommend to make this a batched call.
      @trains = Train.all
  end

  # GET /train_schedules/1/edit
  def edit
  end

  # POST /train_schedules
  # POST /train_schedules.json
  def create
    @train_schedule = TrainSchedule.new(train_schedule_params)
    @train_schedule.days = params[:train_schedule][:days]
    respond_to do |format|
      if @train_schedule.save
        format.json { render json: {success: true}, status: :created, location: @train_schedule }
      else
        format.json { render json: @train_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /train_schedules/1
  # PATCH/PUT /train_schedules/1.json
  def update
    respond_to do |format|
      if @train_schedule.update(train_schedule_params)
        format.html { redirect_to @train_schedule, notice: 'Train schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @train_schedule }
      else
        format.html { render :edit }
        format.json { render json: @train_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /train_schedules/1
  # DELETE /train_schedules/1.json
  def destroy
    @train_schedule.destroy
    respond_to do |format|
      format.html { redirect_to train_schedules_url, notice: 'Train schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train_schedule
      @train_schedule = TrainSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def train_schedule_params
      params
      .require(:train_schedule)
      .permit(:departs, :arrives, :departs_time, :arrives_time, :train_id)
    end

    def authenticate
      authenticate_or_request_with_http_basic('Administration') do |username, password|
        username == 'admin' && password == 'R@ilw@ys'
      end
    end
end
