require "bush_viper/version"
require "faraday"
require "multi_json"
require "ostruct"
require "date"

module BushViper
  module Mendeley
    class API
      BASE_URL = "https://api.mendeley.com/"

      def initialize(token)
        self.token = token
      end

      def documents
        MultiJson.load(get("documents")).map do |doc|
          OpenStruct.new(doc)
        end
      end

      private

      def connection
        @connection ||= Faraday.new(url: BASE_URL)
      end

      def get(url)
        connection.get do |request|
          request.url url
          request.headers["Authorization"] = "Bearer #{token}"
        end.body
      end

      attr_accessor :token
    end
  end
end
