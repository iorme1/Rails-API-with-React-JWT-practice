require 'rails_helper'

RSpec.describe "Bananas", type: :request do
  describe "GET /bananas" do
    it "works! (now write some real specs)" do
      get bananas_path
      expect(response).to have_http_status(200)
    end
  end
end
