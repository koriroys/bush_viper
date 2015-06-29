require "test_helper"

describe "documents" do
  attr_accessor :documents

  before :all do
    self.documents = BushViper::Mendeley::API.new(ENV["ACCESS_TOKEN"]).documents
  end

  it "returns empty array if no documents fetched", :vcr do
    skip
    assert_equal [], documents.all
  end

  it "returns a list of documents", :vcr do
    skip
    assert_equal ["hello"], documents.all
  end

  it "returns a list of possible document types", :vcr do
    possible_document_types = [
      { "name" => "journal", "description" => "Journal article" },
      { "name" => "book", "description" => "Book" },
      { "name" => "generic", "description" => "Generic" },
      { "name" => "book_section", "description" => "Book section" },
      { "name" => "conference_proceedings", "description" => "Conference proceedings" },
      { "name" => "working_paper", "description" => "Working paper" },
      { "name" => "report", "description" => "Report" },
      { "name" => "web_page", "description" => "Web page" },
      { "name" => "thesis", "description" => "Thesis" },
      { "name" => "magazine_article", "description" => "Magazine article" },
      { "name" => "statute", "description" => "Statute" },
      { "name" => "patent", "description" => "Patent" },
      { "name" => "newspaper_article", "description" => "Newspaper article" },
      { "name" => "computer_program", "description" => "Computer program" },
      { "name" => "hearing", "description" => "Hearing" },
      { "name" => "television_broadcast", "description" => "Television broadcast" },
      { "name" => "encyclopedia_article", "description" => "Encyclopedia article" },
      { "name" => "case", "description" => "Case" },
      { "name" => "film", "description" => "Film" },
      { "name" => "bill", "description" => "Bill" }
    ]
    assert_equal documents.types, possible_document_types
  end

  it "can upload a document given a filepath", :vcr do
    params = {
      title: "Test Title",
      type: "Generic"
    }
    document = documents.create(params, filepath: "test/resources/bush_viper.pdf")
    assert_equal "Test Title", document["title"]
    assert_equal "generic", document["type"]
    assert_equal true, document["file_attached"]
  end
end

