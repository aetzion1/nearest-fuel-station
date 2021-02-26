class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :access_times,
              :distance
              
  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:station_name]
    @street = attributes[:street_address]
    @city = attributes[:city]
    @state = attributes[:state]
    @zip = attributes[:zip]
    @fuel_type = attributes[:fuel_type_code]
    @access_times = attributes[:access_days_times]
    @distance = attributes[:distance]
  end

  def address
    "#{@street} #{@city}, #{@state} #{@zip}"
  end

  def travel_time
  end

  def directions
  end

end
