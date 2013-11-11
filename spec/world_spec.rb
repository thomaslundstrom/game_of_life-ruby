require "spec_helper"

describe Life::World do

  it "exists" do
    Life::World.class.to_s.should == "Class"
  end


  context "blinker" do
    let(:world) {
      Life::World.new([
        [0,0,0],
        [1,1,1],
        [0,0,0]])
    }

    it "has state" do
      world.state.should == [
        [0,0,0],
        [1,1,1],
        [0,0,0],
      ]
    end

    it "blinks in a tick" do
      world.tick.state.should == [
        [0,1,0],
        [0,1,0],
        [0,1,0],
      ]
    end
  end

end
