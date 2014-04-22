require 'spec_helper.rb'

describe City do

	let(:austin) { City.new("Austin") }
  let(:dallas) { City.new("Dallas") }

  describe "#initialize" do
    it "initializes a city with a name" do
      expect(austin.name).to eq("Austin")
    end

    it "initializes with an empty roads hash" do
      expect(austin.roads).to eq({})
    end
  end

  describe "#add_road" do
  	it "adds a road between the origin city and a provided destination" do
	  	austin.add_road(dallas.name, 200)

	  	expect(austin.roads).to eq({"Dallas" => 200})
  	end
  end
end

describe Map do

	let(:texas) { Map.new }

	describe "#initialize" do
		it "initializes with an empty cities hash" do
			expect(texas.cities).to eq({})
		end
	end

	describe "#add_city" do
		it "adds a city to the cities hash" do
			texas.add_city("Austin")
			expect(texas.cities.size).to eq(1)

			texas.add_city("Houston")
			expect(texas.cities.size).to eq(2)
		end
	end

	describe "#add_road" do
		it "adds a road to both cities that connects them" do
			austin = texas.add_city("Austin")
			dallas = texas.add_city("Dallas")
			binding.pry
			texas.add_road(austin, dallas, 200)

			expect(texas.cities[austin].roads).to eq({"Dallas" => 200})
			expect(texas.cities[dallas].roads).to eq({"Austin" => 200})
		end
	end
end
