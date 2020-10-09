require 'rails_helper'

RSpec.describe "As a visitor, when I visit /shelters/:id" do
  before :each do
    @shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
  end

  it "Deletes a shelter and returns to the shelters index page" do
    visit "/shelters/#{@shelter_1.id}"

    click_link "Delete"
    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(@shelter_1.name)
  end
end
