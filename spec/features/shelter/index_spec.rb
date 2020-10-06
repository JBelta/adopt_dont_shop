require 'rails_helper'

RSpec.describe "As a visitor, when I visit /shelters" do
  it "Has a name of each shelter in the system" do
    visit "/shelters"

    expect(page).to have_content(@shelter_1.name)
    expect(page).to have_content(@shelter_2.name)
  end
end
