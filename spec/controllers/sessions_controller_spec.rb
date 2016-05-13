require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    context "logged in" do
      before :example do
        @user = FactoryGirl.build(:user)
        login_user
      end

      it "redirects to the home page" do
        get :new

        expect(response).to redirect_to my_home_path
      end
    end

    context "not logged in" do
      it "responds successfully" do
        get :new
        
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      
      it "renders the :new template" do
        get :new
        
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST #create" do
    context "with valid account details" do
      it "logs in the user"
      it "redirects to the home page"
    end

    context "with invalid account details" do
      it "renders the :new template"
    end
  end

  describe "DELETE #destroy" do
    it "logs out the user"
    it "redirects to the log in page"
  end
end