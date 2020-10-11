require 'rails_helper'

describe "The home page" do
  it "Has a link to view shelters" do
    visit '/'
    expect(page).to have_link("Shelters")

    click_link("Shelters")
    expect(current_path).to eq('/shelters')
  end

  it "Has a link to view pets" do
    visit '/'
    expect(page).to have_link("Pets")

    click_link("Pets")
    expect(current_path).to eq('/pets')
  end
end
