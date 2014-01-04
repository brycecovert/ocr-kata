require_relative  'digit'

class Sequence < Struct.new(:numbers)
  def checksum
    return false if numbers.any? { |n| n.nil? }
    numbers.reverse.each_with_index.map { |n, index| n * (index + 1) }.reduce(:+) % 11 == 0
  end

  def to_s
    numbers.map { |n| n.nil? ? "?" : n }.join
  end

  def status_line
    "#{to_s} #{status}".strip
  end

  def status
    return "ILL" if numbers.include? nil
    return "ERR" if !checksum
    return ""
  end

  def self.from_lines(lines)
    Sequence.new Digit.from_lines(lines).map(&:to_i)
  end
end
