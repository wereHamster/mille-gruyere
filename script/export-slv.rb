#!/usr/bin/env ruby

require 'csv'
require File.expand_path('../../config/environment',  __FILE__)

CSV.open("output-slv.csv", "wb") do |csv|
  Category.all.each do |category|
    category.athletes.select do |athlete|
      athlete.lizenz && athlete.lizenz != '' && athlete.zeit
    end.each do |x|
      csv << [ category.cat, x.lizenz, x.zeit_slv ]
    end
  end
end
