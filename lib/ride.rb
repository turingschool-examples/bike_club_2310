class Ride
  attr_reader :name,
              :distance,
              :terrain

  def initialize(info)
    @name = info[:name]
    @distance = info[:distance]
    @loop = info[:loop]
    @terrain = info[:terrain]
  end

  def loop?
    @loop
  end

  #The total distance is double the base distance if the ride is not a loop.
  def total_distance
    if @loop == false
      @distance * 2
    else
      @distance
    end
  end
end