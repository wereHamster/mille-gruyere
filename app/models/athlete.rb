class Athlete < ActiveRecord::Base

  attr_accessible :startnr, :gemeinde, :geschlecht, :jahrgang, :lizenz
  attr_accessible :nachname, :strasse, :verein, :vorname, :zeit


  def plz
    m = /^(\d{4})/.match(gemeinde)
    if (m)
      return m[1]
    else
      ""
    end
  end

  def ort
    m = /^(\d{4}) (.*)/.match(gemeinde)
    if (m)
      return m[2]
    else
      ""
    end
  end

  def zeit=(zeit)
    if zeit.to_i < 0
      write_attribute(:zeit, zeit.to_i)
    else
      m = /(\d+):(\d{2})\.(\d{3})/.match(zeit)
      if m
        write_attribute(:zeit, m[1].to_i * 1000 * 100 + m[2].to_i * 1000 + m[3].to_i)
      elsif zeit == ''
        write_attribute(:zeit, nil)
      else
        errors.add(:zeit, 'Flasches Zeit format (MM:SS.sss)')
      end
    end
  end

  def pad3(value)
    if value < 10
      "00#{value}"
    elsif value < 100
      "0#{value}"
    else
      value.to_s
    end
  end

  def pad2(value)
    if value < 10
      "0#{value}"
    else
      "#{value}"
    end
  end

  def zeit
    zeit = read_attribute(:zeit)
    if zeit == -1
      "n/a"
    elsif zeit == -2
      "dnf"
    elsif zeit
      "#{zeit / 1000 / 100}:#{pad2((zeit / 1000) % 100)}.#{pad3(zeit % 1000)}"
    else
      nil
    end
  end

  def zeit_slv
    zeit = read_attribute(:zeit)
    if zeit == -1
      "n/a"
    elsif zeit == -2
      "dnf"
    elsif zeit
      "#{zeit / 1000 / 100}.#{pad2((zeit / 1000) % 100)}#{pad2((zeit % 1000) / 10)}"
    else
      nil
    end
  end

end
