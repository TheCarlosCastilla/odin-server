class AnswersController < ApplicationController

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

  def log_request(message = "")
    file = File.open('log/test.log', File::WRONLY | File::APPEND)
    file.sync = true
    logger = Logger.new(file, 'daily')

    request_info = "#{request.method},#{request.original_url},source: #{request.ip},Query Params: #{request
    .query_parameters},Request Params: #{request.request_parameters}"

    logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime("%B %d %H:%M:%S")} #{Socket.gethostname}, [#{$$}]:, #{severity} ODIN, #{msg}\n#{request_info}\n***\n"
    end

    logger.info("Test")

    logger.close
  end

end
