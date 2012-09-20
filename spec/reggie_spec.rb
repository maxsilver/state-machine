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


  # Lesson #2 - Concatenation
  describe "concatenation" do
    describe "/abed/" do
      it "matches 'sabed'" do
        regex = Reggie.new("/abed/")
        match = regex =~ "sabed"
        match.should eq(1)
      end
    end

    describe "/board/" do
      it "doesn't match 'sabed'" do
        regex = Reggie.new("/board/")
        match = regex =~ "sabed"
        match.should eq(nil)
      end

      it "matches 'GVSU board of directors" do
        regex = Reggie.new("/board/")
        match = regex =~ "GVSU board of directors"
        match.should eq(5)
      end

    end
  end
  # End #2 - Concatenation


  # Lesson #2 - Wildcard Matching
  describe "wildcard" do
    describe "/d.g/" do
      it "matches 'dog'" do
        regex = Reggie.new("/d.g/")
        match = regex =~ "dog"
        match.should eq(0)
      end
    end

    describe "/c.r/" do
      it "doesn't match 'cooper'" do
        regex = Reggie.new("/c.r/")
        match = regex =~ "cooper"
        match.should eq(nil)
      end

      it "matches 'car'" do
        regex = Reggie.new("/c.r/")
        match = regex =~ "car"
        match.should eq(0)
      end
    end

    describe "/do.rk.../" do
      it "matches 'doorknob'" do
        regex = Reggie.new("/do.rk.../")
        match = regex =~ "doorknob"
        match.should eq(0)
      end

      it "matches 'shiny doorknobs" do
        regex = Reggie.new("/do.rk.../")
        match = regex =~ "shiny doorknobs"
        match.should eq(6)
      end

      it "doesn't match 'dorkswag'" do
        regex = Reggie.new("/do.rk.../")
        match = regex =~ "dorkswag"
        match.should eq(nil)
      end

      it "doesn't match 'doorkit'" do
        regex = Reggie.new("/do.rk.../")
        match = regex =~ "dorkit"
        match.should eq(nil)
      end
    end
  end
  # End #2 - Wildcard


  # Lesson #2 - Zero or One Matching ( "?" character )
  describe "zero or one" do
    describe "/do?g/" do
      it "matches 'dog'" do
        regex = Reggie.new("/do?g/")
        match = regex =~ "dog"
        match.should eq(0)
      end

      it "matches 'dg'" do
        regex = Reggie.new("/do?g/")
        match = regex =~ "dg"
        match.should eq(0)
      end

      it "doesn't match 'dag'" do
        regex = Reggie.new("/do?g/")
        match = regex =~ "dag"
        match.should eq(nil)
      end

      it "doesn't match 'doog'" do
        regex = Reggie.new("/do?g/")
        match = regex =~ "doog"
        match.should eq(nil)
      end
    end
  end
  # End #2 - Zero or One

end