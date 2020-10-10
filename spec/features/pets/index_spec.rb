require 'rails_helper'

RSpec.describe "As a visitor, when I visit /pets" do
  before :each do
    @shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
    @pet_1 = Pet.create(image: 'dog_01.jpg', name: "Maxine", approximate_age: "7", sex: "F", name_of_shelter: @shelter_1.name)
  end
  it "Has a name of each pet in the system" do
    visit "/pets"
    expect(page).to have_content(@pet_1.name)
    # "img" css selector/ class or image wont render
    expect(page).to have_xpath("//img['#{@pet_1.image}']")
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.name_of_shelter)
  end

  #it "Has a link to create a new shelter" do
  #  visit "/shelters"
  #  expect(page).to have_link("New Shelter")

  #  click_on("New Shelter")
  #  expect(current_path).to eq("/shelters/new")
  #end

  #it "Redirects to /shelters and has the new #shelter" do
  #  visit "/shelters/new"

  #  fill_in :name, with: 'Animal House'
  #  fill_in :address, with: '789 New Drive'
  #  fill_in :city, with: 'SouthPo'
  #  fill_in :state, with: 'CT'
  #  fill_in :zip, with: 55555

  #  click_on 'Submit'
  #  expect(current_path).to eq('/shelters')
  #  expect(page).to have_content('Animal #House')
  #end
end
