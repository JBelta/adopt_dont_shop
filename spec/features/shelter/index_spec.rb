require 'rails_helper'

RSpec.describe "As a visitor, when I visit /shelters" do
  before :each do
    @shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
    @shelter_2 = Shelter.create(name: "Cat Cabin", address: "456 Road", city: "Tops", state: "NC", zip: 12321)
  end
  it "Has a name of each shelter in the system" do
    visit "/shelters"
    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end

  it "Has a link to create a new shelter" do
    visit "/shelters"
    expect(page).to have_link("New Shelter")

    click_on("New Shelter")
    expect(current_path).to eq("/shelters/new")
  end

  it "Redirects to /shelters and has the new shelter" do
    visit "/shelters/new"

    fill_in 'Name', with: 'Animal House'
    fill_in 'Address', with: '789 New Drive'
    fill_in 'City', with: 'SouthPo'
    fill_in 'State', with: 'CT'
    fill_in 'Zip', with: 555555

    click_on 'Submit'
    expect(current_path).to eq('/shelters')
    expect(page).to have_content('Animal House')
  end
end
