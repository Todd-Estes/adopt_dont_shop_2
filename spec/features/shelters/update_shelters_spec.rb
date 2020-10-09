require 'rails_helper'

RSpec.describe "shelter update page", type: :feature do
    shelter_1 = Shelter.create(name:      "City Shelter",
                               address:   "100 Main St",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "000000")


  it "can see a link to update the shelter" do
    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_link('Update Shelter', :href=>"/shelters/#{shelter_1.id}/edit")
    end

  it "clicks link and is taken to shelters/new" do
    shelter_1 = Shelter.create(name:      "City Shelter",
                               address:   "100 Main St",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "000000")

    visit "/shelters/#{shelter_1.id}"
    click_link "Update Shelter"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end

  it "can see a shelter update form" do
    shelter_1 = Shelter.create(name:      "City Shelter",
                               address:   "100 Main St",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "000000")

    visit "/shelters/#{shelter_1.id}/edit"

    expect(page).to have_selector('form')
    expect(page).to have_field(with: shelter_1.name)
    expect(page).to have_field(with: shelter_1.address)
    expect(page).to have_field(with: shelter_1.city)
    expect(page).to have_field(with: shelter_1.state)
    expect(page).to have_field(with: shelter_1.zip)
  end

  it "can fill in and click submit button to send PATCH request to /shelters/:id and be redirected to shelter show page where updated shelter info is seen" do
    shelter_1 = Shelter.create(name:      "City Shelter",
                               address:   "100 Main St",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "000000")
    visit "/shelters/#{shelter_1.id}/edit"
    fill_in 'shelter[name]', with: 'Broadway Shelter'

    click_button 'Update'

    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to have_content("Broadway Shelter")
  end
end
