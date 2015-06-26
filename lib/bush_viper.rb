require "bush_viper/version"
require "bush_viper/documents"
require "bush_viper/connection"

module BushViper
  module Mendeley
    class API
      def initialize(token)
        self.token = token
      end

      def documents
        Documents.new(connection)
      end

      def connection
        @connection ||= Connection.new(BASE_URL, token)
      end

      private

      attr_accessor :token
      BASE_URL = "https://api.mendeley.com/"
    end
  end
end
