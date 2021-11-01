require "rails_helper"

RSpec.describe ProjectsController, type: :controller do
    context "GET #index" do
      it "returns a success response" do
        # Perform an http get method and determine if the page is responsive
        get :index
        # expect(response.success).to eq(true)
        expect(response).to be_success
      end
    end
  
    context "GET #show" do
      let!(:project) { Project.create(title: "Test title", description: "Test description") }
      it "returns a success response" do
        # Perform a http get request for show. Check that the response was succesful and the projects are displayed.
        get :show, params: { id: project }
        expect(response).to be_success
      end
    end
  end