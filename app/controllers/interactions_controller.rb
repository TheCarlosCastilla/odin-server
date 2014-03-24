class InteractionsController < ApplicationController

  # GET /interactions
  # GET /interactions.csv
  # GET /interactions.json
  def index
    log_request("Show All Interactions")

    @interactions = Interaction.all
    
    respond_to do |format|
      format.html { @interactions }
      format.csv { send_data @interactions.to_csv}
      format.json { render :json => @interactions.to_json }
    end
  end

  # POST /interactions
  # POST /interactions.json
  def create
    log_request("Insert New Interactions")

    server_time = Time.now.in_time_zone
    phone_time = Time.parse(params[:localtime]).in_time_zone

    time_offset = server_time - phone_time


    if params[:interaction].empty?
      render text: "No Interactions To Save" and return
    else
      params[:interaction].each do |interaction|
        print "\n~~~\n#{interaction}\n~~~\n"


        @interaction = Interaction.new(interaction)

        new_time = Time.parse(@interaction.time) + time_offset
        @interaction.time = new_time.in_time_zone.to_s

        if @interaction.save
          @success = true
          print "Saved Interaction"
        else
          @success = false
          print "Unable To Save Interaction!" and return
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
