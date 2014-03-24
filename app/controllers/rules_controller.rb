class RulesController < ApplicationController

  # GET /rules
  # GET /rules.json
  def index
    log_request("Show All Rules")

    @rules = Rule.all

    @response = {
      rules: @rules
    }

    respond_to do |format|
      format.html { @rules }
      format.json { render :json => @response }
    end
  end

  #GET /rules/user
  def get_rules_by_user
    log_request("Show Schedule for: " + params[:user].to_s)

    @user = params[:user]
    @maxRow = params[:max]

    @rules = Rule.where(user_id: @user)

    if !@maxRow.nil?
      @rules = Rule.where("user_id = ? AND id > ?", @user, @maxRow)
    else
      @rules = Rule.where(user_id: @user)
    end

    @response = {
      rules: @rules
    }

    render :json => @response

    #respond_to do |format|
    #  format.html
    #  format.json { render :json => @response }
    #end
  end

  #GET /rules/new
  def new
    log_request("New Rule Form")

    @rule = Rule.new
  end

  def create
    log_request("Creating New Rule")
    @rule = Rule.new

    @rule.user_id = params[:rule][:user_id]
    @rule.peer_id = params[:rule][:peer_id]
    @rule.delay = params[:rule][:delay]
    @rule.question_id = params[:rule][:question_id]

    if !@rule.save
      flash[:alert] = "Unable to save rule"
      redirect_to action: :new and return
    end

    flash[:notice] = "Successfully Saved New Rule!"
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
