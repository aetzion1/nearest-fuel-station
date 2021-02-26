class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :access_times
              
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
    @fuel_type = attributes[:fuel_type]
    @access_times = attributes[:access_times]
  end

  def distance
  end

  def travel_time
  end

  def directions
  end

end
