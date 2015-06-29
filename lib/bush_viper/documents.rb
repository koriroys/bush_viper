class Documents
  def initialize(connection)
    self.connection = connection
  end

  def all
    connection.get("documents")
  end

  def types
    connection.get("document_types")
  end

  def create(params, filepath: nil, url: nil, filename: nil)
    if filepath
      File.open(filepath, "rb") do |file|
        result = connection.post("documents/", file.read, filename || File.basename(filepath))
        connection.patch(%Q{documents/#{result["id"]}}, params)
      end
    elsif url
      uri = URI.parse(url)
      content = Net::HTTP.get(uri)
      result = connection.post("documents/", content, filename || File.basename(uri.path))
      connection.patch(%Q{documents/#{result["id"]}}, params)
    end
  end

  private

  attr_accessor :connection
end
