require_relative '../digit'
ONE = Digit.new ["   ",
                 "  |",
                 "  |",]
   
TWO = Digit.new [" _ ",
                 " _|",
                 "|_ ",]

describe Digit do 
  it "should split lines into individual digits" do
    Digit.from_lines(["   ",
                      "  |",
                      "  |"]).should == [ONE]
    
    Digit.from_lines(["    _ ",
                      "  | _|",
                      "  ||_ ",]).should == [ONE, TWO]
  end

  it "should find a single digit's value" do
     ONE.to_i.should == 1
     TWO.to_i.should == 2
  end

  it "should recognize a single line of digits" do
    Digit.from_lines([" _  _  _  _  _     _  _  _ ",
                      "|_| _|| | _||_ |_||_   ||_|",
                      " _||_ |_| _||_|  | _|  ||_|"]).map(&:to_i).should == [9, 2, 0, 3, 6, 4, 5, 7, 8]
    
  end
end
