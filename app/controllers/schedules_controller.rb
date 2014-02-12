class SchedulesController < ApplicationController

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
    respond_to do |format|
      format.html
      format.json { render :json => @schedules.to_json }
    end
  end

end
