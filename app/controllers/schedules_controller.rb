class SchedulesController < ApplicationController

  # GET /schedules
  # GET /schedules.json
  def index
    log_request("Show All Schedules")

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
    log_request("Show Schedule For: " + params[:user].to_s)

  	@user = params[:user]
    @maxRow = params[:max]

    if !@maxRow.nil?
      @schedules = Schedule.where("user_id = ? AND sent = ? AND id > ?", @user, false, @maxRow)
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
    log_request("New Schedule Form")

    @schedule = Schedule.new
  end

  def create
    log_request("Creating Schedule")

    @time = Time.new(params[:time][:year].to_i, params[:time][:month].to_i, params[:time][:day].to_i, params[:time][:hour].to_i,
                     params[:time][:minute].to_i, params[:time][:second], "-04:00" )


    if params[:users].nil?
      flash[:alert] = "Please select at least one user"
      redirect_to action: :new and return
    elsif params[:schedule][:question_id].empty?
      flash[:alert] = "Please select a question"
      redirect_to action: :new and return
    else
      @users = params[:users]

      @users.each do |user|

        @schedule = Schedule.new

        @schedule.time = @time.to_s
        @schedule.question_id = params[:schedule][:question_id]
        @schedule.user_id = user
        @schedule.sent = false

        if !@schedule.save
          flash[:alert] = "Unable to save schedule"
          redirect_to action: :new and return
        end
      end
    end

    flash[:notice] = "Successfully Saved New Schedule!"
    redirect_to action: :index
  end

  def log_request(message = "")
    file = File.open('log/test.log', File::WRONLY | File::APPEND)
    file.sync = true
    logger = Logger.new(file, 'daily')

    request_info = "#{request.method},#{request.original_url},source: #{request.ip},Query Params: #{request
    .query_parameters},Request Params: #{request.request_parameters}"

    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime("%B %d %H:%M:%S")} #{Socket.gethostname}, [#{$$}]:, #{severity} ODIN, #{msg}\n#{request_info}\n***\n"
    end

    logger.info("Test")

    logger.close
  end

end
