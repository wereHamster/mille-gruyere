class AthletesController < ApplicationController
  def index
    @athletes = Athlete.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @athletes }
    end
  end

  def show
    @athlete = Athlete.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @athlete }
    end
  end

  def new
    @athlete = Athlete.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @athlete }
    end
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def create
    @athlete = Athlete.new(params[:athlete])

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to @athlete, notice: 'Athlete was successfully created.' }
        format.json { render json: @athlete, status: :created, location: @athlete }
      else
        format.html { render action: "new" }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @athlete = Athlete.find(params[:id])

    respond_to do |format|
      if @athlete.update_attributes(params[:athlete])
        format.html { redirect_to @athlete, notice: 'Athlete was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @athlete.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    @athlete.destroy

    respond_to do |format|
      format.html { redirect_to athletes_url }
      format.json { head :no_content }
    end
  end

  def nachmeldungen
      @athletes = Athlete.where(['startnr >= ?', params[:startnr]])
      render layout: 'bare'
  end

  def switch_names
    athlete = Athlete.find(params[:id])
    tmp = athlete.vorname
    athlete.vorname = athlete.nachname
    athlete.nachname = tmp
    athlete.save
    redirect_to '/athletes'
  end
end
