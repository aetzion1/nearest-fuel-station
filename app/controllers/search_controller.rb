class SearchController < ApplicationController
  def index
    address = params[:location]
    @station = nearest_station(address)
    require 'pry'; binding.pry
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
    require 'pry'; binding.pry
    data = JSON.parse(response.body, symbolize_names: true)
    @station = data[:fuel_stations][0]
  end
end
