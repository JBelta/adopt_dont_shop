require 'rails_helper'

describe "Visiting a new pet page" do
  before :each do
    @shelter = Shelter.create(name: "Puppy Palace", address: "123 Lane", city: "Wepo", state: "CT", zip: 20302)
  end
it "Click on the Create Pet button and a new pet is on the shelter pets page" do

  visit "/shelters/#{@shelter.id}/pets/new"

  fill_in :name, with: 'Poof Ball'
  fill_in :image, with: 'path_string'
  fill_in :description, with: 'Floofy'
  fill_in :approximate_age, with: 5
  fill_in :sex, with: "M"

  click_on "Create Pet"
  expect(current_path).to eq("/shelters/#{@shelter.id}/pets")
  expect(page).to have_content('Poof Ball')
  expect(page).to have_xpath(have_xpath("//img['path_string']"))
  expect(page).to have_content('Floofy')
  expect(page).to have_content(5)
  expect(page).to have_content("M")
  end
end
