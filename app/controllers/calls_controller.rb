class CallsController < ApplicationController
	skip_before_action :authorize

	include MyModule

  def index
  	log_request("Show All Calls")

    @calls = Call.all
    
    respond_to do |format|
      format.html { @calls }
      format.csv { send_data Call.to_csv }
      format.json { render :json => @calls.to_json }
    end
  end

  def create
  	log_request("Insert New Call")

    server_time = Time.now.in_time_zone
    phone_time = Time.parse(params[:localtime]).in_time_zone

    time_offset = server_time - phone_time


    if params[:phone_call].empty?
      log_request("No Calls to save")
      render text: "No Calls To Save" and return
    else
      params[:phone_call].each do |call|
        @call = Call.new(call)

        new_time = Time.parse(@call.time) + time_offset
        @call.time = new_time.in_time_zone.to_s

        if @call.save
          @success = true
          log_request_without_params("Saved a call")
          print "Saved Call"
        else
          @success = false
          log_request_without_params("Unable to save a call")
          print "Unable To Save Call!" and return
        end
      end
    end

    if @success == true
      log_request_without_params("All calls arrived successfully")
      render text: "Data Arrived Successfully"
    else
      log_request_without_params("Unable to save all calls")
      render text: "Unable to save all data"
    end
  end
end
