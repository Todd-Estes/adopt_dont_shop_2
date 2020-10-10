require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can can see the shelter with that id including the shelters name, address, city, state, and zip " do
    shelter_1 = Shelter.create(name:      "Downtown Shelter",
                               address:   "100 Broad Way",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80218")
    pet_1 = shelter_1.pets.create(image_url:   "html.com",
                                       name:    "Kiki",
                            approximate_age:     "1",
                                        sex:    "male")
    visit "/pets/#{pet_1.id}"

    expect(page).to have_content(pet_1.image_url)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.description)
  end
  end
