class RulesController < ApplicationController

  # GET /rules
  # GET /rules.json
  def index
    @rules = Rule.all

    @response = {
      rules: @rules
    }

    respond_to do |format|
      format.html
      format.json { render :json => @response }
    end
  end

  #GET /rules/user
  def get_rules_by_user
    @user = params[:user]

    @rules = Rule.where(user_id: @user)

    @response = {
      rules: @rules
    }

    render :json => @response

    #respond_to do |format|
    #  format.html
    #  format.json { render :json => @response }
    #end
  end

end
