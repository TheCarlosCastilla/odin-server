class SchedulesController < ApplicationController

  # GET /schedules
  # GET /schedules.json!
  def index
    @schedules = Schedule.all

    @response = {
    	events: @schedules
    }

    respond_to do |format|
      format.html { @schedules }
      format.json { render :json => @response }
    end
  end

  #GET /schedules/:user
  def get_schedule_by_user
  	@user = params[:user]
    @maxRow = params[:max]

    if !@max.nil?
      @schedules = Schedule.where("user_id = ? AND sent = ? AND id >= ?", @user, false, @maxRow)
    else
      @schedules = Schedule.where(user_id: @user, sent: 'false')
    end

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

    @time = Time.new(params[:time][:year].to_i, params[:time][:month].to_i, params[:time][:day].to_i, params[:time][:hour].to_i,
                     params[:time][:minute].to_i, params[:time][:second], "-04:00" )


    if params[:users].nil?
      render text: "No users selected" and return
    elsif params[:schedule][:question_id].empty?
      render text: "No questions selected" and return
    else
      @users = params[:users]

      @users.each do |user|

        @schedule = Schedule.new

        @schedule.time = @time.to_s
        @schedule.question_id = params[:schedule][:question_id]
        @schedule.user_id = user
        @schedule.sent = false

        if !@schedule.save
          render text: "Unable to save schedule" and return
        end
      end
    end

    render text: "All schedules saved"
  end

end
