require "rails_helper"

describe UsersController, type: :controller do

  describe "GET #show" do
    before { get :new }
    it { expect(response).to render_template :new }
  end
end