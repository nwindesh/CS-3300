require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do
  scenario "The visitor should see projects" do
    # Visits the root page of the project
    visit root_path
    # Check that the word projects is present on the page
    expect(page).to have_text("Projects")
  end

  
end