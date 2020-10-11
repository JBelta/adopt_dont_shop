require 'rails_helper'

RSpec.describe "As a visitor, when I visit /pets" do
  before :each do
    @shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
    @pet_1 = @shelter_1.pets.create(image: 'dog_01.jpg', name: "Maxine", approximate_age: "7", sex: "F", name_of_shelter: @shelter_1.name, description: "Sweet and Loyal")
  end
  it "Has each pet with their information" do
    visit "/pets"

    expect(page).to have_content(@pet_1.name)
    # "img" css selector/ class or image wont render
    expect(page).to have_xpath("//img['#{@pet_1.image}']")
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.name_of_shelter)
  end
end
