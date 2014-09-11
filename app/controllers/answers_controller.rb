class AnswersController < ApplicationController
  skip_before_action :authorize
  
  include MyModule

  # GET /answers
  # GET /answers.csv
  # GET /answers.json
  def index
    log_request("Show All Answers")

    @answers = Answer.all
    respond_to do |format|
      format.html { @answers }
      format.csv { send_data @answers.to_csv }
      format.json { render :json => @answers.to_json }
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    log_request("Inserting New Answers")

    params.permit!

    server_time = Time.now
    phone_time = Time.parse(params[:localtime])

    time_offset = server_time - phone_time

    if params[:answer].empty?
      log_request_without_params("No Answers To Save")
      render text: "No Answers To Save" and return
    else
      params[:answer].each do |answer|
        @success = false

        @answer = Answer.new(answer)

        new_time = Time.parse(@answer.time) + time_offset
        @answer.time = new_time.in_time_zone.to_s

        if @answer.save
          @success = true
          log_request_without_params("Saved an answer")
          print "Saved Answer"
        else
          @success = false
          log_request_without_params("Unable to save an answer")
          print "Unable To Save Answer!" and return
        end
      end
    end

    if @success == true
      log_request_without_params("All answers arrived successfully")
      render text: "Data Arrived Successfully"
    else
      log_request_without_params("Unable to save all answers")
      render text: "Unable to save all data"
    end
  end


end
