require "rails_helper"

RSpec.describe "shelter pet creation" do
  it "can visit a shelter pet index page and see Create Pet link to add new adoptable pet" do
    shelter_1 = Shelter.create(name:      "Downtown Shelter",
                               address:   "100 Broad Way",
                               city:      "Denver",
                               state:     "CO",
                               zip:       "80218")
    visit "shelters/#{shelter_1.id}/pets"

    expect(page).to have_link("Create Pet")
    expect(page).to have_link("Create Pet", :href=>"/shelters/#{shelter_1.id}/pets/new")
  end

  it "clicks the link and is taken to /shelters/:shelter_id/pets/new and sees creation form" do
    shelter_1 = Shelter.create(name:     "Downtown Shelter",
                             address:   "100 Broad Way",
                             city:      "Denver",
                             state:     "CO",
                             zip:       "80218")

   visit "shelters/#{shelter_1.id}/pets"
   click_link "Create Pet"
   expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
   expect(page).to have_selector('form')
   expect(page).to have_field('Pet name:')
   expect(page).to have_field('Pet description:')
   expect(page).to have_field('Pet approximate age:')
   expect(page).to have_field('sex (female or male):')
   expect(page).to have_field('Pet image_url:')
 end

 it "can create a new pet and be redirected to shelter pet index page " do
  shelter_1 = Shelter.create(name:      "Downtown Shelter",
                            address:   "100 Broad Way",
                            city:      "Denver",
                            state:     "CO",
                            zip:       "80218")

  visit "/shelters/#{shelter_1.id}/pets/new"

  fill_in 'Pet image_url', with: 'google.com'
  fill_in 'Pet name', with: 'Skeeter'
  fill_in 'Pet description', with: 'dog'
  fill_in 'Pet approximate age', with: '1'
  fill_in 'sex (female or male)', with: 'male'

  click_button "Create Pet"

  expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
  expect(page).to have_content("google.com")
  expect(page).to have_content("dog")
  expect(page).to have_content("1")
  expect(page).to have_content("male")
  end
end
