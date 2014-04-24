class Map
  attr_accessor :cities

  def initialize
    @cities = {}
  end

  def add_city(name)
    if @cities[name].nil?
      @cities[name] = City.new(name)
    end
  end

  def get_city(name)
    @cities[name]
  end

  def remove_city(name)
    @cities.delete(name)
  end

  def add_road(origin, destination, distance)
    origin_city = @cities[origin]
    destination_city = @cities[destination]

    origin_city.add_road(destination, distance)
    destination_city.add_road(origin, distance)
  end

  def remove_road(origin, destination)
    origin_city = @cities[origin]
    destination_city = @cities[destination]

    origin_city.roads.delete(destination)
    destination_city.roads.delete(origin)
  end

  # More methods here
  def shortest_path(origin, destination)
    city_name = origin
    origin_city = @cities[origin]
    destination_city = @cities[destination]

    discovered_cities = {origin => 0}
    solved_cities = {}

    while discovered_cities != {}
      @cities[city_name].roads.each do |k, v|
        if discovered_cities[k] == nil
          if solved_cities[k] == nil
            discovered_cities[k] =  v
          end
        elsif discovered_cities[city_name] + v < discovered_cities[k] 
          discovered_cities[k] = discovered_cities[city_name] + v
        end
      end
      solved_cities[city_name] = discovered_cities[city_name]
      discovered_cities.delete(city_name)
      # we sort the discovered_cities and set the city with the nearest
      # distance to a variable that we later use as the new origin city
      if discovered_cities != {}
        sorted_cities = discovered_cities.sort_by { |k, v| v }
        city_name = sorted_cities[0][0]
      end
    end
    solved_cities[destination]
  end
end

class City
  attr_accessor :roads, :name

  def initialize(name)
    @name = name
    @roads = {} # hash to map connected Cities with their respective distance
  end

  def add_road(city, distance)
    @roads[city] = distance
  end
end