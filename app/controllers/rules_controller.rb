class RulesController < ApplicationController
  include MyModule
  
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

    if @maxRow.nil?
      log_request("No MaxRow provided")
      @rules = Rule.where(user_id: @user)
    else
      @rules = Rule.where("user_id = ? AND id > ?", @user, @maxRow)
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
      log_request("Unable to save a rule")
      flash[:alert] = "Unable to save rule"
      redirect_to action: :new and return
    end

    log_request("Successfully save a new rule.")
    flash[:notice] = "Successfully Saved New Rule!"
    redirect_to action: :index
  end


end
