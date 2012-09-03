class Athlete < ActiveRecord::Base
  attr_accessible :gemeinde, :geschlecht, :jahrgang, :lizenz, :nachname, :strasse, :verein, :vorname, :zeit
end
