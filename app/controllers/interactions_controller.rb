class InteractionsController < ApplicationController
  skip_before_action :authorize
  
  include MyModule
  
  # GET /interactions
  # GET /interactions.csv
  # GET /interactions.json
  def index
    log_request("Show All Interactions")

    @interactions = Interaction.last(1000)
    
    respond_to do |format|
      format.html { @interactions }
      format.csv { send_data Interaction.to_csv }
      format.json { render :json => @interactions.to_json }
    end
  end

  def show
    log_request("Show Interactions for one user")
    @interactions = Interaction.where(user_id: params[:id]).order(:id)
  end

  def compare
    log_request("Compare Interactions between two users")
    @interactions = {
      user1: Interaction.where(user_id: params[:id1]).where(peer_id: params[:id2]),
      user2: Interaction.where(user_id: params[:id2]).where(peer_id: params[:id1])
    }
  end

  # POST /interactions
  # POST /interactions.json
  def create
    log_interaction_request(params[:interaction].first[:user_id].to_s)
    log_request("Insert New Interactions")

    params.permit!

    server_time = Time.now.in_time_zone
    phone_time = Time.parse(params[:localtime]).in_time_zone

    time_offset = server_time - phone_time


    if params[:interaction].empty?
      log_request_without_params("No Interactions to save")
      render text: "No Interactions To Save" and return
    else
      params[:interaction].each do |interaction|
        @interaction = Interaction.new(interaction)

        new_time = Time.parse(@interaction.time) + time_offset
        @interaction.time = new_time.in_time_zone.to_s

        if @interaction.save
          @success = true
          log_request_without_params("Saved an interaction")
          print "Saved Interaction"
        else
          @success = false
          log_request_without_params("Unable to save an interaction")
          print "Unable To Save Interaction!" and return
        end
      end
    end

    if @success == true
      log_request_without_params("All interactions arrived successfully")
      render text: "Data Arrived Successfully"
    else
      log_request_without_params("Unable to save all interactions")
      render text: "Unable to save all data"
    end
  end

end
