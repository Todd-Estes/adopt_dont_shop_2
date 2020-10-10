require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see the each pet in the system, including the pets data" do
    pet_1 = Pet.create(image_url:      "html.com",
                            name:      "Downtown Shelter",
                 approximate_age:      "100 Broad Way",
                             sex:      "Denver",
                    shelter_name:      "80218")

    visit "/pets"

    expect(page).to have_content(pet_1.image_url)
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter_name)
  end
end
