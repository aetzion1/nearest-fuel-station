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
    
    expect(current_path).to eq search_path

    expect(page).to have_css('.station_info')

    expect(page).to have_content('Seventeenth Street Plaza')
    expect(page).to have_content('Address: 1225 17th St. Denver, CO 80202')
    expect(page).to have_content('Fuel Type: ELEC')
    expect(page).to have_content('Access Times: ')
    expect(page).to have_content('Distance: 0.0934')
    expect(page).to have_content('Directions: Start out going southeast on 17th St toward Larimer St/CO-33.')
    expect(page).to have_content('Travel Time: 164')
  end
end
