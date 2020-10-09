require 'rails_helper'

RSpec.describe "As a visitor, when I visit /shelters/:id/edit" do
  before :each do
    @shelter_1 = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
    @shelter_2 = Shelter.create(name: "Cat Cabin", address: "456 Road", city: "Tops", state: "NC", zip: 12321)
  end

  it "I can fill out the form with updated info, submit and return to the shelters show page" do
    visit "/shelters/#{@shelter_1.id}/edit"

    fill_in :name, with: 'Animal Hut'
    fill_in :address, with: '987 Old Road'
    fill_in :city, with: 'NorthPo'
    fill_in :state, with: 'TC'
    fill_in :zip, with: 44444

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    expect(page).to have_content('Animal Hut')
    expect(page).to have_content('987 Old Road')
    expect(page).to have_content('NorthPo')
    expect(page).to have_content('TC')
    expect(page).to have_content(44444)
  end


end
