require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see the each pet in the system, including the pets data" do
    shelter_1 = Shelter.create(name:      "Downtown Shelter",
                               address:   "100 Broad Way",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80218")
    pet_1 = shelter_1.pets.create(image_url:   "html.com",
                                       name:    "Kiki",
                            approximate_age:     "1",
                                        sex:    "male")
    visit "/pets"

    expect(page).to have_content(pet_1.image_url)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(shelter_1.name)
  end
end
