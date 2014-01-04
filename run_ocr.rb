#!/usr/bin/env ruby
require_relative 'digit'
require_relative 'sequence'

if __FILE__ == $PROGRAM_NAME
  if ARGV.length != 1
    puts <<-eof 
      This will read a sequence file, 27 charachers wide, and 3 lines long, with 1 newline between each case.
      Please invoke this way:
      ./run_ocr.rb recommended_test_cases.txt"
    eof
    exit 1
  end
  all_lines = IO.read(ARGV.pop).split("\n")
  all_lines.each_slice(4).each do |test_case|
    puts test_case[0..2]
    puts "\n=> " + Sequence.from_lines(test_case[0..2]).status_line
  end
end
