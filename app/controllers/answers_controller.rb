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

    params[:answer].each do |answer|
      print "\n~~~\n#{answer}\n~~~\n"

      @answer = Answer.new(answer)

      new_time = Time.parse(@answer.time) + time_offset
      @answer.time = new_time.in_time_zone.to_s

      if @answer.save
        print "Successfully saved answer!"
      else
        print "Unable to save answer!"
      end
    end

    render :text => "All answers were successfully saved"
  end

end
