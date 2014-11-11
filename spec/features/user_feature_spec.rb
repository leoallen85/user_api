RSpec.describe "Users API" do

  let(:expected_body) do
    {
      username: 'test',
      email: 'test@example.com'
    }.to_json
  end

  let(:user_params) do
    {
      username: 'test',
      email: 'test@example.com',
      password: '123password'
    }
  end

  it "creates a user" do
    post "/users", user_params

    expect(last_response.body).to have_json_path("id")
    expect(last_response.body).to be_json_eql(expected_body)
  end

  context "given a specific user" do

    let(:user) { User.create(user_params) }

    context "when reading a user" do

      before { get "/users/#{user.id}" }

      it "provides details for that user" do
        expect(last_response.body).to be_json_eql(expected_body)
      end
    end

    context 'when deleting a user' do

      before { delete_user }

      context "given a correct API key" do

        let(:api_key) { '12345abc' }

        it "deletes the user" do
          expect(last_response.status).to eq 204
          expect(User.get(user.id)).to be nil
        end
      end

      context "given an invalid API key" do

        let(:api_key) { 'invalid-key' }

        it "does not allow the user to be deleted" do
          expect(last_response.status).to eq 401
        end
      end

      def delete_user
        header 'Authorization', api_key
        delete "/users/#{user.id}"
      end
    end
  end
end
