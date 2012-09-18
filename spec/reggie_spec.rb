require 'spec_helper'

describe Reggie do

  # Lesson 1 - It should exist
  it "should exist" do
    Reggie.should be
  end
  # End Lesson 1

  # Lesson 2 - Matching Single Characters
  describe "matching single characters" do
    describe "/a/" do
      it "matches 'a'" do
        regex = Reggie.new("/a/")
        match = regex =~ "a"
        match.should eq(0)
      end

      it "doesn't match 'b'" do
        regex = Reggie.new("/a/")
        match = regex =~ "b"
        match.should eq(nil)
      end
    end

    describe "/b/" do
      it "matches 'b'" do
        regex = Reggie.new("/b/")
        match = regex =~ "abed"
        match.should eq(1)
      end
    end
  end
  # End #2 - Matching Single Characters


end