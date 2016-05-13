require "rails_helper"

describe My::HomesController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  before { login_user(user) }

  describe "GET #show" do
    before { get :show }
    it { expect(response).to render_template :show }
  end
end