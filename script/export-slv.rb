#!/usr/bin/env ruby

require 'csv'
require File.expand_path('../../config/environment',  __FILE__)

CSV.open("output-slv.csv", "wb") do |csv|
  Category.all.each do |category|
    category.athletes.select {|x| x.zeit.to_i > 0 }.each do |x|
      csv << [ category.cat, x.lizenz, x.nachname, x.vorname, x.strasse, x.plz, x.ort, x.jahrgang, x.verein, x.zeit_slv ]
    end
  end
end
