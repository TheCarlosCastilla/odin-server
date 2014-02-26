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
    @new_schedule = Schedule.new(schedule_params)
#    @new_schedule.date = params["@schedule"]["date"]
#    @new_schedule.time = params["@schedule"]["time"]
#    @new_schedule.question_id = params["@schedule"]["question_id"]
#    @new_schedule.user_id = params["@schedule"]["user_id"]
    @new_schedule.sent = false
    @new_schedule.save

    render text: @new_schedule.to_json
  end



  private
    def schedule_params
      params.require("@schedule").permit("date", "time", "question_id", "user_id")
    end

end
