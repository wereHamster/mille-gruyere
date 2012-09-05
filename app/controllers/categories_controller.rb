class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def startliste
    @category = Category.find(params[:id])
    render layout: 'bare'
  end

  def rangliste
    @category = Category.find(params[:id])
    render layout: 'bare'
  end

  def result
    athlete = Athlete.find(params[:startnr])
    athlete.update_attribute(:zeit, params[:zeit])
    if athlete.errors[:zeit].empty?
      redirect_to category_path(params[:id])
    else
      flash[:error] = athlete.errors[:zeit].first
      redirect_to category_path(params[:id])
    end
  end

  def diplom
    @category = Category.find(params[:category])
    @athlete  = Athlete.find(params[:athlete])
    @rang     = params[:rang]

    render layout: 'diplom'
  end

end
