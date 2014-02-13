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
      format.html
      format.json { render :json => @response }
    end
  end
    
end
