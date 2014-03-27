class PagesController < ApplicationController
  skip_before_action :authorize
  
  include MyModule

  def index
    log_request("Index Page")
  end

end
