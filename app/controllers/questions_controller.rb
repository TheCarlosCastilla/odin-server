class QuestionsController < ApplicationController
  skip_before_action :authorize
  
  include MyModule
  
  # GET /questions
  # GET /questions.json
  def index
    log_request("Show All Questions")

    @maxRow = params[:max]

    if @maxRow.nil?
      log_request_without_params("No MaxRow provided")
      @questions  = Question.all
      @choices = Choice.all
    else
      @questions = Question.where("id > ?", @maxRow)
      @choices = Choice.where("question_id > ?", @maxRow)
    end

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
    4.times {@question.choices.build}
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
      log_request_without_params("Unable to save a question")
      flash[:alert] = "Unable to save question"
      redirect_to action: :new and return
    end

    log_request_without_params("Successfully save a new question")
    flash[:notice] = "Successfully Saved New Question!"
    redirect_to action: :index
  end

    
end
