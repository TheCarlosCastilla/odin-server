class UsersController < ApplicationController

	# GET /users
  # GET /users.json
  def index
    log_request("Show All Users")

    @users = ValidUser.all
    respond_to do |format|
      format.html { @users }
      format.json { render :json => @users.to_json }
    end
  end

	# GET /request_user_id/uuid
	def request_user_id
    log_request("Request User ID for phone: " + params[:uuid].to_s)

		@uuid = params[:uuid]
		@user = User.next(@uuid)

		render :text => @user
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
