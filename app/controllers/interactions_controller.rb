class InteractionsController < ApplicationController

  # GET /interactions
  # GET /interactions.csv
  # GET /interactions.json
  def index
    @interactions = Interaction.all
    
    respond_to do |format|
      format.html
      format.csv { send_data @interactions.to_csv}
      format.json { render :json => @interactions.to_json }
    end
  end

  # POST /interactions
  # POST /interactions.json
  def create
    server_time = Time.now.in_time_zone
    phone_time = Time.parse(params[:localtime]).in_time_zone

    time_offset = server_time - phone_time

    params[:interaction].each do |interaction|
      print "\n~~~\n#{interaction}\n~~~\n"


      @interaction = Interaction.new(interaction)

      new_time = Time.parse(@interaction.time) + time_offset
      @interaction.time = new_time.in_time_zone.to_s

      if @interaction.save
        print "Successfully saved interaction!"
      else
        print "Unable to save interactions! Please Try Again"
        return
      end
    end

    render :text => "All interactions were successfully saved"
  end
end
