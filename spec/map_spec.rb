require 'spec_helper.rb'

describe City do

	let(:austin) { City.new("Austin") }
  let(:dallas) { City.new("Dallas") }

  describe ".initialize" do
    it "initializes a city with a name" do
      expect(austin.name).to eq("Austin")
    end

    it "initializes with an empty roads hash" do
      expect(austin.roads).to eq({})
    end
  end

  describe "#add_road" do
  	it "adds a road between the origin city and a provided destination" do
	  	austin.add_road(dallas.name, 300)

	  	expect(austin.roads).to eq({"Dallas" => 300})
  	end
  end
end

describe Map do

	let(:map) { Map.new }

	describe ".initialize" do
		it "initializes with an empty cities hash" do
			expect(map.cities).to eq({})
		end
	end

	describe "#add_city" do
		it "adds a city to the cities hash" do
			map.add_city("Austin")
			expect(map.cities["Austin"].name).to eq("Austin")
			expect(map.cities.size).to eq(1)

			map.add_city("Houston")
			expect(map.cities.size).to eq(2)
		end
	end

	describe "#get_city" do
		it "gets a city object from the cities hash" do
			map.add_city("Austin")
			city = map.get_city("Austin")
			expect(city.name).to eq("Austin")
			expect(city.roads).to eq({})
		end
	end

	describe "#remove_city" do
		it "removes a city object from the cities hash" do
			map.add_city("Austin")
			city = map.get_city("Austin")
			expect(city.name).to eq("Austin")
			expect(city.roads).to eq({})
		end
	end

	describe "#add_road" do
		it "adds a road to both cities that connects them" do
			map.add_city("Austin")
			map.add_city("Dallas")
			map.add_city("Houston")
			map.add_road("Austin", "Dallas", 300)
			map.add_road("Austin", "Houston", 150)

			atx = map.get_city("Austin")
			dal = map.get_city("Dallas")
			hou = map.get_city("Houston")

			expect(atx.roads).to eq({"Dallas" => 300, "Houston" => 150})
			expect(dal.roads).to eq({"Austin" => 300})
			expect(hou.roads).to eq({"Austin" => 150})
		end
	end

	describe "#remove_road" do
		it "can delete a road" do
	    map.add_city("Austin")
	    map.add_city("Dallas")
	    map.add_city("Houston")
	    map.add_road("Austin", "Dallas", 300)
	    map.add_road("Austin", "Houston", 150)

			atx = map.get_city("Austin")
			dal = map.get_city("Dallas")
			hou = map.get_city("Houston")

	    map.remove_road("Austin", "Houston")

	    expect(atx.roads).to eq({"Dallas" => 300})
	    expect(dal.roads).to eq({"Austin" => 300})
	    expect(hou.roads).to eq({})
	  end
	end

	describe "#shortest_path" do
		it "it returns the shortest path from an origin city to a destination" do
			map.add_city("Atlanta")
	    map.add_city("Podunk")
	    map.add_city("Ottowa")
	    map.add_city("Marfa")
	    map.add_city("Nola")
	    map.add_city("Berlin")
	    map.add_road("Atlanta", "Podunk", 5)
	    map.add_road("Atlanta", "Nola", 700)
	    map.add_road("Atlanta", "Ottowa", 200)
	    map.add_road("Atlanta", "Marfa", 300)
	    map.add_road("Podunk", "Marfa", 400)
	    map.add_road("Nola", "Marfa", 400)
	    map.add_road("Nola", "Berlin", 300)
	    map.add_road("Marfa", "Ottowa", 1000)
	    map.add_road("Berlin", "Ottowa", 1000)

			result = map.shortest_path("Atlanta", "Berlin")

	    expect(result).to eq(1000)
		end
	end
end
