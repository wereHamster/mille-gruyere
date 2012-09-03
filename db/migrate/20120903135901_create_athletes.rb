class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :vorname
      t.string :nachname
      t.string :strasse
      t.string :gemeinde
      t.integer :jahrgang
      t.string :geschlecht
      t.string :verein
      t.string :lizenz
      t.integer :zeit

      t.timestamps
    end
  end
end
