# encoding: UTF-8

class Category
  attr_reader :name, :titel, :jahrgang, :geschlecht, :cat


  def self.all
    [
      Category.new("M2006", "Mädchen, 2006 und jünger", (2006..2015), "Mädchen", "W09"),
      Category.new("K2006", "Knaben, 2006 und jünger",  (2006..2015), "Knabe",   "M09"),

      Category.new("M2005", "Mädchen, 2005", (2005..2005), "Mädchen", "W10"),
      Category.new("K2005", "Knaben, 2005",  (2005..2005), "Knabe",   "M10"),

      Category.new("M2004", "Mädchen, 2004", (2004..2004), "Mädchen", "W11"),
      Category.new("K2004", "Knaben, 2004",  (2004..2004), "Knabe",   "M11"),

      Category.new("M2003", "Mädchen, 2003", (2003..2003), "Mädchen", "W12"),
      Category.new("K2003", "Knaben, 2003",  (2003..2003), "Knabe",   "M12"),

      Category.new("M2002", "Mädchen, 2002", (2002..2002), "Mädchen", "W13"),
      Category.new("K2002", "Knaben, 2002",  (2002..2002), "Knabe",   "M13"),

      Category.new("M2001", "Mädchen, 2001", (2001..2001), "Mädchen", "W14"),
      Category.new("K2001", "Knaben, 2001",  (2001..2001), "Knabe",   "M14"),

      Category.new("M2000", "Mädchen, 2000", (2000..2000), "Mädchen", "W15"),
      Category.new("K2000", "Knaben, 2000",  (2000..2000), "Knabe",   "M15"),
    ]
  end

  def self.find(name)
    all.select{|x| x.name == name }.first
  end


  def initialize(name, titel, jahrgang, geschlecht, cat)
    @name       = name
    @titel      = titel
    @jahrgang   = jahrgang
    @geschlecht = geschlecht
    @cat        = cat
  end

  def athletes
    ret = Athlete.where("geschlecht = ? AND jahrgang IN (?)", geschlecht, jahrgang)
    ret.sort do |a,b|
      az = a.read_attribute(:zeit)
      if az && az < 0 then az = 99999999 end

      bz = b.read_attribute(:zeit)
      if bz && bz < 0 then bz = 99999999 end

      if (az && bz) then
        az <=> bz
      elsif (!az && !bz)
        a.startnr <=> b.startnr
      else
        (az || 999999999) <=> (bz || 999999999)
      end
      # (a.read_attribute(:zeit) || 999999999) <=> (b.read_attribute(:zeit) || 9999999999)
    end
  end

  def geschlecht_plural
    if geschlecht == 'Knabe'
      'Knaben'
    else
      geschlecht
    end
  end

end
