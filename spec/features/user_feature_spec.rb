RSpec.describe "users" do

  let(:user_json) do
    {username: @user.username, email: @user.email}
  end

  it "creates a user" do
    post "/users", params: {username: "test"}
    expect(last_response.body).to eq user
  end

  context "given a specific user" do
    it "reads the user" do

    end

    it "deletes the user" do

    end

    context "given an invalid API key" do
      it "does not allow the user to be deleted" do

      end
    end
  end
end
