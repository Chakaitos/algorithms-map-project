require 'spec_helper.rb'

describe City do

	before do
	  @atx = City.new("Austin")
	  @dal = City.new("Dallas")
	end

  describe "#initialize" do
    it "initializes a city with a name" do
      expect(@atx.name).to eq("Austin")
    end

    it "initializes with an empty roads hash" do
      expect(@atx.roads).to eq({})
    end
  end

  describe "#add_road" do
  	it "adds a road between the origin city and a provided destination" do
	  	@atx.add_road(@dal.name, 200)
	  	expect(@atx.roads).to eq({"Dallas" => 200})
  	end
  end
end

describe Map do
end
