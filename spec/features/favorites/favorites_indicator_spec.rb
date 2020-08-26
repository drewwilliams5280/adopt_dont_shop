require 'rails_helper'

RSpec.describe "favorites indicator", type: :feature do
  it "can see a favorites indicator" do
    visit "/shelters"
    expect(page).to have_link("Favorites:#{Favorite.all.count}")
end
end
