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

  def create(params, filepath: nil)
    if filepath
      File.open(filepath, "rb") do |file|
        result = connection.post("documents/", file.read, File.basename(filepath))
        connection.patch(%Q{documents/#{result["id"]}}, params)
      end
    else
    end
  end

  private

  attr_accessor :connection
end
