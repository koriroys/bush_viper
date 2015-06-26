require "test_helper"

describe BushViper::Mendeley::API do
  it "defines the base url constant" do
    BushViper::Mendeley::API::BASE_URL.must_equal "https://api.mendeley.com/"
  end
end
