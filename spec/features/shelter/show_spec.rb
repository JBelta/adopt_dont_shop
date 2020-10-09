require 'rails_helper'

RSpec.describe "As a visitor, when I visit /shelters/:id" do
  before :each do
    @shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
    @shelter_2 = Shelter.create(name: "Cat Cabin", address: "456 Road", city: "Tops", state: "NC", zip: 12321)
  end
  it "Shows the shelters address, city, state and zip" do
    visit "/shelters/#{@shelter_1.id}"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_1.address)
    expect(page).to have_content(@shelter_1.city)
    expect(page).to have_content(@shelter_1.state)
    expect(page).to have_content(@shelter_1.zip)

    visit "/shelters/#{@shelter_2.id}"

    expect(page).to have_content(@shelter_2.name)
    expect(page).to have_content(@shelter_2.address)
    expect(page).to have_content(@shelter_2.city)
    expect(page).to have_content(@shelter_2.state)
    expect(page).to have_content(@shelter_2.zip)
  end

  it "Has a link to update a shelters information" do
    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link("Update")

    click_link 'Update'
    expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
  end

  it "Has a link to delete the shelter" do
    visit "/shelters/#{@shelter_1.id}"
    expect(page).to have_link("Delete")
  end
end
