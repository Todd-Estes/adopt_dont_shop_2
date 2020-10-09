require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see the name of each shelter in the system" do
    shelter_1 = Shelter.create(name:      "Downtown Shelter",
                               address:   "100 Broad Way",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80218")
    shelter_2 = Shelter.create(name:      "Old Towne Shelter",
                               address:   "505 Ralston St",
                               city:      "Arvada",
                               state:     "CO",
                               zip:       "80002")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
