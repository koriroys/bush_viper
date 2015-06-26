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

  private

  attr_accessor :connection
end
