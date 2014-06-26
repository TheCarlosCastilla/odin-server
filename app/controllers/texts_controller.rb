class TextsController < ApplicationController
	skip_before_action :authorize

	include MyModule

  def index
  	log_request("Show All Texts")

    @texts = Text.all
    
    respond_to do |format|
      format.html { @texts }
      format.csv { send_data Text.to_csv }
      format.json { render :json => @texts.to_json }
    end
  end

  def create
  	log_request("Insert New Text")

    server_time = Time.now.in_time_zone
    phone_time = Time.parse(params[:localtime]).in_time_zone

    time_offset = server_time - phone_time


    if params[:text].empty?
      log_request("No Texts to save")
      render text: "No Texts To Save" and return
    else
      params[:text].each do |text|
        @text = Text.new(text)

        new_time = Time.parse(@text.time) + time_offset
        @text.time = new_time.in_time_zone.to_s

        if @text.save
          @success = true
          log_request_without_params("Saved a text")
          print "Saved text"
        else
          @success = false
          log_request_without_params("Unable to save a text")
          print "Unable To Save Text!" and return
        end
      end
    end

    if @success == true
      log_request_without_params("All Texts arrived successfully")
      render text: "Data Arrived Successfully"
    else
      log_request_without_params("Unable to save all texts")
      render text: "Unable to save all data"
    end
  end
end
