RSpec.describe "Homes", type: :request do
  describe "GET root" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end
end
