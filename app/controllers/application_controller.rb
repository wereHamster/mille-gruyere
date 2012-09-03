class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_categories

  def index
  end


private

  def load_categories
    @categories = Category.all
  end

end
