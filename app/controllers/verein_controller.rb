class VereinController < ApplicationController

    def show
        @verein   = params[:verein]
        @athletes = Athlete.where(:verein => params[:verein]).order(:startnr)

        render layout: 'bare'
    end
end
