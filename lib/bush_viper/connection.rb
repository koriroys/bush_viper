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
    end
    MultiJson.load(result.body)
  end

  def post(endpoint, file, filename)
    result = connection.post do |request|
      request.url endpoint
      request.headers["Content-Disposition"] = %Q{attachment; filename="#{filename}"}
      request.headers["Authorization"] = "Bearer #{token}"
      request.body = file
    end
    MultiJson.load(result.body)
  end

  def patch(endpoint, params)
    params = MultiJson.dump(params)
    result = connection.patch do |request|
      request.url endpoint
      request.headers["Authorization"] = "Bearer #{token}"
      request.headers['Content-Type'] = "application/vnd.mendeley-document.1+json"
      request.body = params
    end
    MultiJson.load(result.body)
  end

  private

  attr_accessor :connection, :token
end
