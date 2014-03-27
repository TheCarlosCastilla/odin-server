class UsersController < ApplicationController
  skip_before_action :authorize
  include MyModule
  
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

	
end
