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

  # def get_road(origin, destination)
  #   @cities[origin].roads(destination)
  # end

  def remove_road(origin, destination)
    origin_city = @cities[origin]
    destination_city = @cities[destination]

    origin_city.roads.delete(destination)
    destination_city.roads.delete(origin)
  end

  # More methods here
  def shortest_path(origin, destination)
    origin_city = @cities[origin]
    destination_city = @cities[destination]

    discovered_cities = {}
    solved_cities = {}
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