require "rails_helper"

RSpec.describe "pet update" do
  it "can visit a pet show page and see a link to update pet info" do
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

  expect(page).to have_link('Update Pet', :href=>"/pets/#{pet_1.id}/edit")
 end


 it 'can click Update Pet link and go see it has a form to edit pet data' do
   shelter_1 = Shelter.create(name:      "Downtown Shelter",
                            address:   "100 Broad Way",
                            city:      "Denver",
                            state:     "CO",
                            zip:       "80218")
   pet_1 = shelter_1.pets.create(image_url:        "google.com",
                                name:             "Scooter",
                                approximate_age:  "2",
                                sex:              "Female",
                                description:      "dog")
   visit "/pets/#{pet_1.id}"

   click_link "Update Pet"

   expect(current_path).to eq("/pets/#{pet_1.id}/edit")
   expect(page).to have_selector('form')
   expect(page).to have_field(with: pet_1.image_url)
   expect(page).to have_field(with: pet_1.name)
   expect(page).to have_field(with: pet_1.approximate_age)
   expect(page).to have_field(with: pet_1.sex)
   expect(page).to have_field(with: pet_1.description)
 end

 it 'has submit button which when clicked sends PATCH request, updates pet, redirects to Pet Show page with updated data' do
   shelter_1 = Shelter.create(name:      "Downtown Shelter",
                            address:   "100 Broad Way",
                            city:      "Denver",
                            state:     "CO",
                            zip:       "80218")
   pet_1 = shelter_1.pets.create(image_url:        "google.com",
                                name:             "Scooter",
                                approximate_age:  "2",
                                sex:              "Female",
                                description:      "dog")
   visit "/pets/#{pet_1.id}/edit"

   fill_in 'pet[name]', with: 'Taco'
   fill_in 'pet[approximate_age]', with: 2
   fill_in 'pet[sex]', with: 'female'
   fill_in 'pet[description]', with: "doggo"
   fill_in 'pet[image_url]', with: "google.com"

   click_button 'Submit Updates'

   expect(current_path).to eq("/pets/#{pet_1.id}")
   expect(page).to have_content("Taco")
   expect(page).to have_content("2")
   expect(page).to have_content("female")
   expect(page).to have_content("doggo")
   expect(page).to have_content("google.com")

 end
end
