module MyModule

  def log_request(message = "")
    file = File.open('log/requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')


    request_info = "#{request.method}, #{request.original_url}, source: #{request.ip}, Query Params: #{request
    .query_parameters}, Request Params: #{request.request_parameters}"

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime("%B %d %H:%M:%S")} #{Socket.gethostname}, [#{$$}]:, #{severity} ODIN, #{msg}\n#{request_info}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end

  def log_request_without_params(message = "")
    file = File.open('log/requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime("%B %d %H:%M:%S")} #{Socket.gethostname}, [#{$$}]:, #{severity} ODIN, #{msg}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end


  def log_imei(imei)
    file = File.open('log/new_phones.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, "daily")

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "#{datetime.strftime("%B %d %H:%M:%S")} #{Socket.gethostname}, [#{$$}]:, Request from IMEI: #{msg}\n***\n"
    end

    custom_logger.info(imei)

    custom_logger.close

  end

end