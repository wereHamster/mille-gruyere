# encoding: UTF-8

class Category
  attr_reader :name, :titel, :jahrgang, :geschlecht, :cat


  def self.all
    [
      Category.new("K2003", "Knaben, 2003 und jünger",  (2003..2012), "Knabe",   "M09"),
      Category.new("M2003", "Mädchen, 2003 und jünger", (2003..2012), "Mädchen", "W09"),

      Category.new("K2002", "Knaben, 2002",  (2002..2002), "Knabe",   "M10"),
      Category.new("M2002", "Mädchen, 2002", (2002..2002), "Mädchen", "W10"),

      Category.new("K2001", "Knaben, 2001",  (2001..2001), "Knabe",   "M11"),
      Category.new("M2001", "Mädchen, 2001", (2001..2001), "Mädchen", "W11"),

      Category.new("K2000", "Knaben, 2000",  (2000..2000), "Knabe",   "M12"),
      Category.new("M2000", "Mädchen, 2000", (2000..2000), "Mädchen", "W12"),

      Category.new("K1999", "Knaben, 1999",  (1999..1999), "Knabe",   "M13"),
      Category.new("M1999", "Mädchen, 1999", (1999..1999), "Mädchen", "W13"),

      Category.new("K1998", "Knaben, 1998",  (1998..1998), "Knabe",   "M14"),
      Category.new("M1998", "Mädchen, 1998", (1998..1998), "Mädchen", "W14"),

      Category.new("K1997", "Knaben, 1997",  (1997..1997), "Knabe",   "M15"),
      Category.new("M1997", "Mädchen, 1997", (1997..1997), "Mädchen", "W15"),

      Category.new("M1989", "Mädchen, 1989", (1989..1989), "Mädchen", ""),
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
      (a.read_attribute(:zeit) || 999999999) <=> (b.read_attribute(:zeit) || 9999999999)
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
