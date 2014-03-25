class PagesController < ApplicationController
  include MyModule

  def index
    log_request("Index Page")
  end

end
