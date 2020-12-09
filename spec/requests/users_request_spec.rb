RSpec.describe "Users", type: :request do
  let(:user) do
    FactoryBot.create(:user)
  end

  describe "GET index" do
    context "as an authenticated user" do
      it "returns http successful" do
        sign_in user
        get users_path
        aggregate_failures do
          expect(response).to be_successful
          expect(response).to have_http_status(:ok)
        end
      end
    end

    context "as a guest" do
      it "not returns http success before login" do
        get users_path
        aggregate_failures do
          expect(response).to have_http_status(:found)
          expect(response).to redirect_to new_user_session_path
        end
      end
    end
  end
end
