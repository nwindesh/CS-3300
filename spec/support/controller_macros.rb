module ControllerMacros
    def login_user
      # Before each test, create and login the user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        user = FactoryBot.create(:user)
        # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
        sign_in user
      end
    end

    def login_user_capybara
        # Before each test, create and login the user
        before(:each) do
          #@request.env["devise.mapping"] = Devise.mappings[:user]
          user = FactoryBot.create(:user)
          # user.confirm! # Or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
          within("form") do
            fill_in "email", with: "test@user.com"
            fill_in "password", with: "qwerty"
          end
          click_button "Log in"
          login_as(user, :scope => :user)
          #visit root_path
        end
      end
    
  
    # Not used in this tutorial, but left to show an example of different user types
    # def login_admin
    #   before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:admin]
    #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
    #   end
    # end
  end