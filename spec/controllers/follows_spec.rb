require "rails_helper"

describe FollowsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #index" do
    before { get :index, user_id: user.id }
    it { expect(response).to render_template :index }
  end
end