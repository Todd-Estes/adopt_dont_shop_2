# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# it 'can see and click a link get to pet edit page' do
#   shelter_1 = Shelter.create(name:      "Downtown Shelter",
#                              address:   "100 Broad Way",
#                              city:      "Denver",
#                              state:     "CO",
#                              zip:       "80218")
#    pet_1 = shelter_1.pets.create(image_url:        "google.com",
#                                  name:             "Scooter",
#                                  approximate_age:  "2",
#                                  sex:              "Female",
#                                  description:      "dog")
#   visit "/pets/#{pet_1.id}"
#   click_link('Edit Pet')
#
#   expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
# end
