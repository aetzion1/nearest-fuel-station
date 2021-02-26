class SearchController < ApplicationController
  def index
    address = params[:location]
    data = nearest_station(address)
    @station = Station.new(data)
    @travel_time = travel_time(@station.address, address),
    @directions = directions(@station.address, address)
  end

  private

  def nearest_station(address)
    # refactor into own conn method when in service
    conn = Faraday.new(
      url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/',
      params: { api_key: ENV['NREL_API_KEY'] }
    )

    response = conn.get('nearest.json') do |req|
      req.params[:location] = address
    end

    data = JSON.parse(response.body, symbolize_names: true)
    @station = data[:fuel_stations][0]
  end

  def map_quest_conn
    conn = Faraday.new(
      url: 'http://www.mapquestapi.com/directions/v2/',
      params: { key: ENV['MAPQUEST_API_KEY'] }
    )
  end

  def directions(to, from)
    response = map_quest_conn.get('route') do |req|
      req.params[:from] = from
      req.params[:to] = to
    end

    data = JSON.parse(response.body, symbolize_names: true)
    directions = []
    data[:route][:legs][0][:maneuvers].each do |maneuver|
      directions << maneuver[:narrative]
    end
    directions
  end

  def travel_time(from, to)
    response = map_quest_conn.get('route') do |req|
      req.params[:from] = from
      req.params[:to] = to
    end

    data = JSON.parse(response.body, symbolize_names: true)
    travel_time = data[:route][:realTime]
  end



end
