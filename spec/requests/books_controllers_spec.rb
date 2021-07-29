require 'rails_helper'

RSpec.describe "Books API", type: :request do
  describe "GET /books" do
    it "returns all books" do
      FactoryBot.create(:book)
      FactoryBot.create(:book)
      get '/api/v1/books'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
  describe "POST /books" do
    it "create new book" do 
      expect {
        post '/api/v1/books', params: {book: {title: "The Martian", author: "Andy Wier"} }
        expect(response).to have_http_status(:created)
    }.to change {Book.count}.from(0).to(1)  
    end
  end

  describe "DELETE /books/:id"  do
    it "should delete a book" do 
      FactoryBot.create(:book)
      byebug
      delete '/api/v1/books/1'
      expect(response).to have_http_status(:no_content)
    end
  end
end
