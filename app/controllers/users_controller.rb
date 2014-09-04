class UsersController < ApplicationController
  skip_before_action :authorize
  include MyModule
  
  # GET /users
  # GET /users.json
  # GET /users.csv
  def index
    log_request("Show All Users")

    @valid = ValidUser.all
    @users = User.all
    respond_to do |format|
      format.html { @valid }
      format.json { render :json => @users.to_json }
      format.csv { send_data @users.to_csv }
    end
  end

  # GET /request_user_id/uuid
  def request_user_id
    log_request("Request User ID for phone: " + params[:uuid].to_s)
    #log_request("Phone Number: " + params[:phoneNumber])

    @imei = params[:uuid]
    #@raw_num = params[:phoneNumber]
    log_imei(@imei)

    #@user = User.next(@imei, @raw_num)
    @user = User.next(@imei)

    render :text => @user
  end

  def for_boris
    @users = User.all
    respond_to do |format|
      format.csv { send_data @users.to_csv_with_imei }
    end
  end
	
end
