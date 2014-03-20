class RulesController < ApplicationController

  # GET /rules
  # GET /rules.json
  def index
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
    @user = params[:user]
    @maxRow = params[:max]

    @rules = Rule.where(user_id: @user)

    if !@maxRow.nil?
      @rules = Schedule.where("user_id = ? AND id >= ?", @user, @maxRow)
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
    @rule = Rule.new
  end

  def create
    @rule = Rule.new

    @rule.user_id = params[:rule][:user_id]
    @rule.peer_id = params[:rule][:peer_id]
    @rule.delay = params[:rule][:delay]
    @rule.question_id = params[:rule][:question_id]

    if !@rule.save
      render text: "Unable to save rule" and return
    end

    render text: "All rules saved"
  end

end
