require 'rails_helper'

RSpec.describe "shelter creation page", type: :feature do
  it "can see a link to create a new shelter index page" do
  visit "/shelters"

  expect(page).to have_link("New Shelter", :href=>"/shelters/new" )
  end

  it "clicks link and is taken to shelters/new" do
    visit "/shelters"
    click_link "New Shelter"

    expect(current_path).to eq('/shelters/new')
  end

  it "can see a new shelter form" do
    visit "shelters/new"

    expect(page).to have_selector('form')
    expect(page).to have_field('Shelter name')
    expect(page).to have_field('Shelter address')
    expect(page).to have_field('Shelter city')
    expect(page).to have_field('Shelter state')
    expect(page).to have_field('Shelter zip')
  end

  it "can click Create Shelter button to send POST request to /shelters and be redirected to shelter index page   where new shelter is seen" do
    visit "shelters/new"
    fill_in 'Shelter name', with: 'Broadway Shelter'
    fill_in 'Shelter address', with: '100 Main St'
    fill_in 'Shelter city', with: 'Denver'
    fill_in 'Shelter state', with: 'CO'
    fill_in 'Shelter zip', with: '80218'

    click_button 'Create Shelter'

    expect(current_path).to eq('/shelters')
    expect(page).to have_content("Downtown Shelter")
  end






end
