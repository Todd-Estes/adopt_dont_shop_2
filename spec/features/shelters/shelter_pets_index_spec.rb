require 'rails_helper'

RSpec.describe 'shelter pets index' do
  it 'can visit a shelter show page and see its pets info' do
    shelter_1 = Shelter.create(name:      "Downtown Shelter",
                               address:   "100 Broad Way",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80218")
    pet_1 = shelter_1.pets.create(image_url:          "html.com",
                                  name:               "Fido",
                                  approximate_age:    "1",
                                  sex:                "Male",
                                  description:        "doge")
    pet_2 = shelter_1.pets.create(image_url:          "google.com",
                                  name:               "Scooter",
                                  approximate_age:    "2",
                                  sex:                "Female",
                                  description:        "doge")



    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content(pet_1.image_url)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)

    expect(page).to have_content(pet_2.image_url)
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)

    


  end
end
