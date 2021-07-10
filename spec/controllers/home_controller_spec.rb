require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET /index" do
    it "returns main page with all tiny links" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
