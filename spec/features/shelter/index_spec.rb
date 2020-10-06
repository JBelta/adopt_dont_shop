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
end
