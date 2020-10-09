require "rails_helper"

RSpec.describe "shelters show page", type: :feature do
  it "see the shelter with that id including the shelters name, address, city, state, and zip " do
    shelter_1 = Shelter.create(name:      "Downtown Shelter",
                               address:   "100 Broad Way",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80218")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
   end
 end
