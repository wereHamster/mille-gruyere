class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    @categories = Category.all
  end

end
