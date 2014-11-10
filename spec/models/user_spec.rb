RSpec.describe User do

  it { should validate_presence_of    :username   }
  it { should validate_presence_of    :email   }
  it { should validate_format_of(:email ).with(:email_address)  }

  it { should validate_presence_of    :password   }

  context "creating a user" do

    let(:params) do
      {
        username: 'test',
        email: 'test@example.com',
        password: '123password'
      }
    end

    let(:user) {  User.create(params) }

    it "saves the user to the database" do
      expect(user).to be_saved
    end

    # We just want to make sure this is changing it to a something different
    it "hashes the user password" do
      expect(user.password).not_to eql '123password'
    end
  end
end