class AnswersController < ApplicationController

  # GET /answers
  # GET /answers.csv
  # GET /answers.json
  def index
    @answers = Answer.all
    respond_to do |format|
      format.html
      format.csv { send_data @answers.to_csv }
      format.json { render :json => @answers.to_json }
    end
  end

  # POST /answers
  # POST /answers.json
  def create
    server_time = Time.now
    phone_time = Time.parse(params[:localtime])

    time_offset = server_time - phone_time

    if params[:answer].empty?
      render text: "No Answers To Save" and return
    else
      params[:answer].each do |answer|
        @success = false

        @answer = Answer.new(answer)

        new_time = Time.parse(@answer.time) + time_offset
        @answer.time = new_time.in_time_zone.to_s

        if @answer.save
          @success = true
          print "Saved Answer"
        else
          @success = false
          print "Unable To Save Answer!" and return
        end
      end
    end

    if @success == true
      render text: "Data Arrived Successfully"
    else
      render text: "Unable to save all data"
    end
  end
end
