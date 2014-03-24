class PagesController < ApplicationController
  def index
    log_request
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

    logger.info(message)

    logger.close
  end

end
