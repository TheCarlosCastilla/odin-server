class QuestionsController < ApplicationController

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all

    respond_to do |format|
      format.html
      format.json { render :json => @questions.to_json }
    end
  end
    
end
