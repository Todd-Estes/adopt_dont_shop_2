require "rails_helper"

RSpec.describe "pet delete" do
  it "can visit a pet show page and see a link to delete the pet" do
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

  expect(page).to have_link('Delete Pet')
  end

  it "can click the delete link, delete the shelter, and be redirected to the shelter show page where the shelter will be gone" do
    shelter_1 = Shelter.create(name:      "City Shelter",
                               address:   "100 Main St",
                               city:      "Golden",
                               state:     "CO",
                               zip:       "000000")
    pet_1 = shelter_1.pets.create(image_url:   "html.com",
                                name:    "Kiki",
                                approximate_age:     "1",
                                sex:    "male")
    visit "/pets/#{pet_1.id}"

    click_link "Delete Pet"

    expect(current_path).to eq("/pets")

    expect(page).to have_no_content("#{pet_1.name}")
  end
end
