require "faraday"
require "multi_json"

class Connection
  def initialize(url, token)
    self.connection = Faraday.new(url: url)
    self.token = token
  end

  def get(endpoint)
    result = connection.get do |request|
      request.url endpoint
      request.headers["Authorization"] = "Bearer #{token}"
    end.body
    MultiJson.load(result)
  end

  private

  attr_accessor :connection, :token
end
