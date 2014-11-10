class User
    include DataMapper::Resource

    property :id, Serial
    property :username, String, required: true
    property :email, String, required: true, format: :email_address
    property :password, BCryptHash, required: true
end