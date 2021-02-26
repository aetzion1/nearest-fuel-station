class SearchController < ApplicationController
  def index

  private

  def nearest_station(address)
    conn = Faraday.new(url: 'https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest')
    
    response = conn.get('/.json') do |req|
      params = {api_key: ['NREL_API_KEY'],
      params = {location: address}
    end
    
    data = JSON.parse(response.body, symbolize_names: true)
    @station = json[:fuel_stations][0]


end