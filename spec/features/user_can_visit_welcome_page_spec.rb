require 'rails_helper'

describe "user can visit the welcome page" do
  scenario "and see a dropdown menu" do
    visit '/'
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  scenario "and selects Turing from the start location and search" do
    visit '/'

    select('Turing', from: :location)
    click_button "Find Nearest Station"

    save_and_open_page
    
    expect(current_path).to eq search_path

    expect(page).to have_content(station.name)
    expect(page).to have_content(station.address)
    expect(page).to have_content(station.fuel_type)
    expect(page).to have_content(station.access_times)
    expect(page).to have_content(station.distance)
    expect(page).to have_content(station.travel_time)
    expect(page).to have_content(station.directions)
  end
end
