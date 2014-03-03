class SchedulesController < ApplicationController

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all

    @response = {
    	events: @schedules
    }

    respond_to do |format|
      format.html
      format.json { render :json => @response }
    end
  end

  #GET /schedules/:user
  def get_schedule_by_user
  	@user = params[:user]

    @schedules = Schedule.where(user_id: @user, sent: 'false')

    @response = {
    	events: @schedules
    }

    #@schedules.each do |schedule|
    #  schedule.update(sent: 'true')
    #end

    render :json => @response

    #respond_to do |format|
    #  format.html
    #  format.json { render :json => @response }
    #end
  end

  #GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  def create

    @time = Time.new(params[:time][:year].to_i, params[:time][:month].to_i, params[:time][:day].to_i, params[:time][:hour].to_i, params[:time][:minute].to_i, params[:time][:second], "-05:00" )

    @schedule = Schedule.new()

    @schedule.time = @time.to_s
    @schedule.question_id = params[:schedule][:question_id]
    @schedule.user_id = params[:schedule][:user_id]
    @schedule.sent = false

    @schedule.save

    render text: @schedule.to_json
  end



  private
    def schedule_params
      params.require(:schedule).permit(:question_id, :user_id)
    end

end
