require "rails_helper"

RSpec.describe "shelter deletion", type: :feature do
  shelter_1 = Shelter.create(name:      "City Shelter",
                             address:   "100 Main St",
                             city:      "Denver",
                             state:     "CO",
                             zip:       "000000")

  it "can see a link to delete the shelter on the shelter show page" do
    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link("Delete Shelter")
  end

  it "can click the delete link, delete the shelter, and be redirected to the shelter show page where the shelter will be gone" do
    shelter_1 = Shelter.create(name:      "City Shelter",
                               address:   "100 Main St",
                               city:      "Golden",
                               state:     "CO",
                               zip:       "000000")
    visit "/shelters/#{shelter_1.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq("/shelters")

    expect(page).to have_no_content("#{shelter_1.city}")
  end
end
