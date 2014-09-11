module MyModule

  def log_request(message = "")
    file = File.open('log/requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')


    request_info = "#{request.method}, #{request.original_url}\nsource: #{request.ip}\nQuery Params: #{request
    .query_parameters}\nRequest Params: #{request.request_parameters}"

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\n#{datetime.strftime("%B %d %H:%M:%S")} [#{$$}]: #{severity} ODIN\n#{msg}\n#{request_info}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end

  def log_request_without_params(message = "")
    file = File.open('log/requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\n#{datetime.strftime("%B %d %H:%M:%S")} [#{$$}]: #{severity} ODIN\n#{msg}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end


  def log_imei(imei)
    file = File.open('log/new_phones.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, "daily")

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\n#{datetime.strftime("%B %d %H:%M:%S")} [#{$$}]:\nRequest from IMEI: #{msg}\n***\n"
    end

    custom_logger.info(imei)

    custom_logger.close

  end

  def log_schedule_request(message = "")
    file = File.open('log/schedule_requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\nAT: #{datetime.strftime("%B %d %H:%M:%S")}\nFOR:#{msg}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end

  def log_rule_request(message = "")
    file = File.open('log/rule_requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\nAT: #{datetime.strftime("%B %d %H:%M:%S")}\nFOR:#{msg}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end

  def log_interaction_request(message = "")
    file = File.open('log/interaction_requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\nAT: #{datetime.strftime("%B %d %H:%M:%S")}\nFOR:#{msg}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end

  def log_answer_request(message = "")
    file = File.open('log/answer_requests.log', File::WRONLY | File::APPEND | File::CREAT)
    file.sync = true
    custom_logger = Logger.new(file, 'daily')

    custom_logger.formatter = proc do |severity, datetime, progname, msg|
      "~~~\nAT: #{datetime.strftime("%B %d %H:%M:%S")}\nFOR:#{msg}\n***\n"
    end

    custom_logger.info(message)

    custom_logger.close
  end

end
