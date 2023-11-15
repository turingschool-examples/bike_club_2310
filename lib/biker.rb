class Biker
  attr_reader :name, 
              :max_distance, 
              :rides, 
              :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {}
    @acceptable_terrain = []
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end

  def log_ride(ride, time)
    if @acceptable_terrain.include?(ride.terrain) && @rides[ride] && ride.total_distance <= @max_distance
      @rides[ride] << time
    elsif @acceptable_terrain.include?(ride.terrain) && ride.total_distance <= @max_distance
      @rides[ride] = [time]
    else
      false
    end
  end

  #A Biker can report its personal record for a specific ride. 
  #This is the lowest time recorded for a ride. 
  #This method will return false if the Biker hasn't completed the ride
  
  def personal_record(ride)
    if @rides[ride]
      @rides[ride].min
    else
      false
    end
  end

  def total_logged_rides 
    total = 0
    @rides.each do |ride, time|
      total += @rides[ride].count
    end
    total
  end
end