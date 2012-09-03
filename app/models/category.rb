# encoding: UTF-8

class Category
  attr_reader :name, :titel, :jahrgang, :geschlecht


  def self.all
    [
      Category.new("K2003", "Knaben, 2003 und jünger",  (2003..2012), "Knabe"),
      Category.new("M2003", "Mädchen, 2003 und jünger", (2003..2012), "Mädchen"),

      Category.new("K2002", "Knaben, 2002",  (2002..2002), "Knabe"),
      Category.new("M2002", "Mädchen, 2002", (2002..2002), "Mädchen"),

      Category.new("K2001", "Knaben, 2001",  (2001..2001), "Knabe"),
      Category.new("M2001", "Mädchen, 2001", (2001..2001), "Mädchen"),

      Category.new("K2000", "Knaben, 2000",  (2000..2000), "Knabe"),
      Category.new("M2000", "Mädchen, 2000", (2000..2000), "Mädchen"),

      Category.new("K1999", "Knaben, 1999",  (1999..1999), "Knabe"),
      Category.new("M1999", "Mädchen, 1999", (1999..1999), "Mädchen"),

      Category.new("K1998", "Knaben, 1998",  (1998..1998), "Knabe"),
      Category.new("M1998", "Mädchen, 1998", (1998..1998), "Mädchen"),

      Category.new("K1997", "Knaben, 1997",  (1997..1997), "Knabe"),
      Category.new("M1997", "Mädchen, 1997", (1997..1997), "Mädchen"),
    ]
  end

  def self.find(name)
    all.select{|x| x.name == name }.first
  end


  def initialize(name, titel, jahrgang, geschlecht)
    @name       = name
    @titel      = titel
    @jahrgang   = jahrgang
    @geschlecht = geschlecht
  end

  def athletes
    Athlete.where("geschlecht = ? AND jahrgang IN (?)", geschlecht, jahrgang)
  end

  def geschlecht_plural
    if geschlecht == 'Knabe'
      'Knaben'
    else
      geschlecht
    end
  end

end
