class AddStartnrToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :startnr, :integer
  end
end
