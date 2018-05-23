require 'rails_helper'

RSpec.describe "Devos", type: :request do
  describe "GET /devos" do
    it "works! (now write some real specs)" do
      get devos_path
      expect(response).to have_http_status(200)
    end
  end
end
