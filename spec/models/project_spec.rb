require "rails_helper"


RSpec.describe Project, type: :model do

    context "validations tests" do
        # Login user is a before each block
        let(:user) {login_user}
        it "ensures the title is present" do
            #login_user
            # Create a new project without a title
            project = Project.new(description: "Content of the description")
            # Check if the project object is not valid
            expect(project.valid?).to eq(false)
        end

        # Test description is present
        it "ensures the description is present" do
            # Create a project without a description
            project = Project.new(title: "Content")
            # Check that the project is invalid without a description
            expect(project.valid?).to eq(false)
        end

        
        it "should be able to save project" do
            project = Project.new(title: "Title", description: "Some description content goes here")
            # Check that the created project is being saved
            expect(project.save).to eq(true)
        end
    end

    context "scopes tests" do
        #let(:user) {login_user}
        # Create a params identifier of title and description to quickly create new projects
        let(:params) { { title: "Title", description: "some description" } }
        before(:each) do
            Project.create(params)
            Project.create(params)
            Project.create(params)
        end

        it "should return all projects" do
            # Check that the amount of projects equals the amount that have been created
            expect(Project.count).to eq(3)
        end
    end
end