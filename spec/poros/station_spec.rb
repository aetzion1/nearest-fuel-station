require 'rails_helper'

RSpec.describe Station do
  describe 'Station poro' do
    it 'builds a Station object' do
      null = nil
      attrs = {
        station_name: "Gus's Gas",
        fuel_type: 'ECE',
        street: '123 Apple St',
        city: 'Denver',
        state: 'C0',
        zip: '80208',
        access_times: null,
        distance: 1
      }
      station = Station.new(attrs)

      expect(station).to be_a(Station)
      expect(station).to have_attributes(
        name: "Gus's Gas",
        fuel_type: 'ECE',
        address: '123 Apple St, Denver, C0, 80208',
        access_times: null,
        distance: 1
      )
    end
  end

  describe 'instance methods' do
    before :each do
      null = nil
      attrs = {
        station_name: "Gus's Gas",
        fuel_type: 'ECE',
        street: '123 Apple St',
        city: 'Denver',
        state: 'C0',
        zip: '80208',
        access_times: null,
        distance: 1
      }
      @station = Station.new(attrs)
      @from = '1331 17th St LL100, Denver, CO 80202'
    end

    it "directions" do
      expect(@station.directions(@station.address, @from)).to eq(["TBD"])
    end

    it "travel_time" do
      expect(@station.travel_time(@station.address, @from)).to eq(["TBD"])
    end
  end
end
