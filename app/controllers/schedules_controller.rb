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
    @schedule = Schedule.new(params[@schedule])
    @schedule.save

    render text: @schedule
  end

end
