require "test_helper"

describe BushViper::Mendeley::API do
  it "defines the base url constant" do
    BushViper::Mendeley::API::BASE_URL.must_equal "https://api.mendeley.com/"
  end

  it "initializes with an access_token" do
    BushViper::Mendeley::API.new("token").send(:token).must_equal "token"
  end
end
