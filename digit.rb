class Digit < Struct.new(:text)
  def to_i
    Digit.from_lines([" _     _  _     _  _  _  _  _ ",
                      "| |  | _| _||_||_ |_   ||_||_|",
                      "|_|  ||_  _|  | _||_|  ||_| _|"]).index(self)
  end

  def self.from_lines (lines)
    lines.map { |line| line.scan(/.{3}/) }.transpose.map(&method(:new))
  end
end
