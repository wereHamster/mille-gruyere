class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_categories

  def index
  end


  def startlisten
    @categories = Category.all
    render layout: 'bare'
  end

  def ranglisten
    @categories = Category.all
    render layout: 'bare'
  end

private

  def load_categories
    @categories = Category.all
  end

end
