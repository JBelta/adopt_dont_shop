require 'rails_helper'

RSpec.describe "As a visitor, when I visit /pets/:id" do
  before :each do
    @shelter = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
    @pet = @shelter.pets.create(image: 'dog_01.jpg', name: "Maxine", approximate_age: "7", sex: "F", name_of_shelter: @shelter.name, description: "Sweet and Loyal")
  end
  it "Shows the shelters address, city, state and zip" do
    visit "/pets/#{@pet.id}"

    expect(page).to have_content(@pet.image)
    expect(page).to have_content(@pet.name)
    expect(page).to have_content(@pet.description)
    expect(page).to have_content(@pet.approximate_age)
    expect(page).to have_content(@pet.adopt_status)

  end

#  it "Has a link to update a shelters information" do
#    visit "/shelters/#{@shelter_1.id}"
#    expect(page).to have_link("Update")
#
#    click_link 'Update'
#    expect(current_path).to eq("/shelters/##{@shelter_1.id}/edit")
#  end
#
#  it "Has a link to delete the shelter" do
#    visit "/shelters/#{@shelter_1.id}"
#    expect(page).to have_link("Delete")
#  end
end
