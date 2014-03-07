class UsersController < ApplicationController

	# GET /users
  # GET /users.json
  def index
    @users = User.all
    respond_to do |format|
      format.html { @users }
      format.json { render :json => @users.to_json }
    end
  end

	# GET /request_user_id/uuid
	def request_user_id
		@uuid = params[:uuid]
		@user = User.next(@uuid)

		render :text => @user

#		if @user.class == String
#			render :text => @user
#		else
#			msg = @user.user_id
#			render :text => msg
#		end
	end
	
end
