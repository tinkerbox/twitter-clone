require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    context "logged in" do
      before :example do
        @user = FactoryGirl.build(:user)
        login_user
        get :new
      end

      it "redirects to the home page" do
        expect(response).to redirect_to my_home_path
      end
    end

    context "not logged in" do
      before { get :new }

      it "responds successfully" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      
      it "renders the :new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "POST #create" do
    before { post :create, login_params }

    let(:user_password) { "somepassword" }
    let(:user) { FactoryGirl.create(:user, password: user_password, password_confirmation: user_password ) }

    context "with valid account details" do
      let(:login_params) { { email: user.email, password: user_password} }

      it "logs in the user" do
        expect(logged_in?).to eq true
      end

      it "redirects to the home page" do
        expect(response).to redirect_to my_home_path
      end
    end

    context "with invalid account details" do
      let(:login_params) { { email: user.email, password: user_password + "asdfasd"} }

      it "renders the :new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy }
    
    it "logs out the user" do
      expect(logged_in?).to eq false
    end

    it "redirects to the log in page" do
      expect(response).to redirect_to log_in_path
    end
  end
end