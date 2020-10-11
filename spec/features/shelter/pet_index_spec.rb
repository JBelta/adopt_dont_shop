require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/shelters/:shelter_id/pets'" do
    before :each do
      @shelter = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
      @pet_1 = @shelter.pets.create(image: 'dog_01.jpg', name: "Maxine", approximate_age: "7", sex: "F", name_of_shelter: @shelter.name)
      @pet_2 = @shelter.pets.create(image: 'dog_02.jpg', name: "Slobber", approximate_age: "2", sex: "M", name_of_shelter: @shelter.name)
    end
    it "Then I see each Pet that can be adopted from that Shelter with that shelter_id including pet's image, name and aproxamit age'" do
      visit "/shelters/#{@shelter.id}/pets"

      expect(page).to have_xpath("//img['#{@pet_1.image}']")
      expect(page).to have_xpath("//img['#{@pet_2.image}']")
      expect(page).to have_content(@pet_1.name)
      expect(page).to have_content(@pet_2.name)
      expect(page).to have_content(@pet_1.approximate_age)
      expect(page).to have_content(@pet_2.approximate_age)
    end
    it "Has a link to create a new pet" do
      visit "/shelters/#{@shelter.id}/pets"
      expect(page).to have_link("New Pet")

      click_link "New Pet"
      expect(current_path).to eq("/shelters/#{@shelter.id}/pets/new")
    end
  end
end
