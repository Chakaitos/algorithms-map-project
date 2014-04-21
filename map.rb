class Map
  def add_city(name)
  end

  def remove_city(name)
  end

  def add_road(origin, destination, distance)
  end

  def remove_road(origin, destination)
  end

  # More methods here

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