class QuestionsController < ApplicationController

  # GET /questions
  # GET /questions.json
  def index
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
    @question = Question.new
    3.times {@question.choices.build}
  end

  def create
    @question = Question.new
    @question.question_text = params[:question][:question_text]

    @question.choices.new(choice_id: "-2", choice_text: "Question was Lost/Unseen/Unanswered")
    @question.choices.new(choice_id: "-1", choice_text: "Refuse to Answer")

    params[:question][:choices_attributes].each do |choice|
      @question.choices.new(choice_id: "#{choice.first.to_i + 1}", choice_text: "#{choice.second[:choice_text]}" )
    end

    if !@question.save
      render text: "Unable to save schedule" and return
    end

    render text: "All Questions and Choices Saved!"
  end
    
end
