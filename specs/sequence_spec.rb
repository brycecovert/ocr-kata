require_relative '../sequence'

describe Sequence do
  context "when account number is valid" do
    it "should pass checksum" do
      Sequence.new([3, 4, 5, 8, 8, 2, 8, 6, 5]).checksum.should == true
      Sequence.new([4, 5, 7, 5, 0, 8, 0, 0, 0]).checksum.should == true
    end

    it "should have a status line without an error" do
      Sequence.new([4, 5, 7, 5, 0, 8, 0, 0, 0]).status_line.should == "457508000"
    end
  end

  context "when account number is not valid" do
    it "should not pass checksum" do
      Sequence.new([3, 4, 5, 8, 8, 1, 8, 6, 5]).checksum.should == false
      Sequence.new([6, 6, 4, 3, 7, 1, 4, 9, 5]).checksum.should == false
    end

    it "should have a status line with an error" do
      Sequence.new([3, 4, 5, 8, 8, 1, 8, 6, 5]).status_line.should == "345881865 ERR"
    end
  end

  context "when account number has an unreadable digit" do
    it "should not pass checksum" do
      Sequence.new([3, 4, 5, nil, 8, 1, 8, 6, 5]).checksum.should == false
    end

    it "should have a status with a warning" do
      Sequence.new([3, 4, 5, nil, 8, 1, 8, 6, 5]).status_line.should == "345?81865 ILL"
    end
  end

  it "should parse from text" do
    Sequence.from_lines([" _  _  _  _  _     _  _  _ ",
                         "|_| _|| | _||_ |_||_   ||_|",
                         " _||_ |_| _||_|  | _|  ||_|"]).numbers.should == [9, 2, 0, 3, 6, 4, 5, 7, 8]
  end
end
