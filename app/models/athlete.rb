class Athlete < ActiveRecord::Base
  attr_accessible :gemeinde, :geschlecht, :jahrgang, :lizenz, :nachname, :strasse, :verein, :vorname, :zeit


  def zeit=(zeit)
    m = /(\d+):(\d{2})\.(\d{3})/.match(zeit)
    if m
      write_attribute(:zeit, m[1].to_i * 1000 * 100 + m[2].to_i * 1000 + m[3].to_i)
    elsif zeit == ''
      write_attribute(:zeit, nil)
    else
      errors.add(:zeit, 'Flasches Zeit format (MM:SS.sss)')
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
    if zeit
      "#{zeit / 1000 / 100}:#{pad2((zeit / 1000) % 100)}.#{pad3(zeit % 1000)}"
    else
      nil
    end
  end

  def zeit_slv
    zeit = read_attribute(:zeit)
    if zeit
      "#{zeit / 1000 / 100}.#{pad2((zeit / 1000) % 100)}#{pad2((zeit % 1000) / 10)}"
    else
      nil
    end
  end

end
