require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  
  context "Create new project" do

    # Implement a before statement that will execute before each scenario
    before(:each) do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      visit new_project_path
      within("form") do
        fill_in "Title", with: "Test title"
      end
    end

    
    scenario "should be successful" do

      fill_in "Description", with: "Test description"
      click_button "Create Project"
      # Check that a successful project creation informs the user that it was successful
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      # Check that the page informs the user that the description cannot be blank when creating a project
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do

    # Create a dummy project for the sets of update project tests
    let(:project) { Project.create(title: "Test title", description: "Test content") }

    # Before each test visit the edit page 
    before(:each) do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Description", with: "New description content"
      end
      click_button "Update Project"
      # Check that after updating a project a confirmation message is displayed
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("form") do
        fill_in "Description", with: ""
      end
      click_button "Update Project"
      # Check that the expected error message appears when updating
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    before(:each) do
      user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
      login_as(user, :scope => :user)
    end

    # Create a project for the tests
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Destroy"
      # Check that a confirmation is displayed
      expect(page).to have_content("Project was successfully destroyed")
      # Check that the project was actually destroyed and does not exist somewhere off the page.
      expect(Project.count).to eq(0)
    end
  end
end