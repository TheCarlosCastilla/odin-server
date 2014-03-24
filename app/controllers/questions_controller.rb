class QuestionsController < ApplicationController

  # GET /questions
  # GET /questions.json
  def index
    log_request("Show All Questions")

    @questions = Question.all
    @choices = Choice.all

    @response = {
    	questions: @questions,
    	choices: @choices
    }

    respond_to do |format|
      format.html { @questions }
      format.json { render :json => @response }
    end
  end

  # GET /questions/new
  def new
    log_request("New Question Form")

    @question = Question.new
    3.times {@question.choices.build}
  end

  def create
    log_request("Creating Question")

    @question = Question.new
    @question.question_text = params[:question][:question_text]

    @question.choices.new(choice_id: "-2", choice_text: "Question was Lost/Unseen/Unanswered")
    @question.choices.new(choice_id: "-1", choice_text: "Refuse to Answer")

    params[:question][:choices_attributes].each do |choice|
      @question.choices.new(choice_id: "#{choice.first.to_i + 1}", choice_text: "#{choice.second[:choice_text]}" )
    end

    if !@question.save
      flash[:alert] = "Unable to save question"
      redirect_to action: :new and return
    end

    flash[:notice] = "Successfully Saved New Question!"
    redirect_to action: :index
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
