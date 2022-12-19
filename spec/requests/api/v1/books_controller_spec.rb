RSpec.describe Api::V1::BooksController do
  let(:book)  { FactoryBot.create(:book) }
  let(:books) { FactoryBot.create_list(:book, 3) }

  describe 'Index:' do
    before { books }

    it 'returns all books' do
      get "/api/v1/books"

      expect(response.status).to eq 200
      parsed_ids = JSON.parse(response.body).map { |results| results['data']['id'] }
      expect(parsed_ids).to contain_exactly(*books.map(&:id))
    end
  end

  describe 'Show:' do
    it 'returns the requested book' do
      get "/api/v1/books/#{book.id}"

      expect(response.status).to eq 200
      parsed_ids = JSON.parse(response.body)['data']['id']
      expect(parsed_ids).to eq book.id
    end
  end

  describe 'Create:' do
    it 'creates and returns the book' do
      params = { data: { title: 'Test Title', genre: 'Test Genre', author: 'Test Author' } }
      post "/api/v1/books", params: params

      new_book = Book.last
      expected_results = {
        id: new_book.id,
        type: "book",
        attributes: {
          title:      params[:data][:title],
          genre:      params[:data][:genre],
          author:     params[:data][:author],
          created_at: new_book.created_at,
          updated_at: new_book.updated_at
        }
      }.as_json.deep_symbolize_keys

      expect(response.status).to eq 200
      parsed_response = JSON.parse(response.body).deep_symbolize_keys[:data]
      expect(parsed_response).to eq expected_results
    end
  end

  describe 'Update:' do
    it 'updates and returns the requested book' do
      params = { data: { title: 'Updated Title', genre: 'Updated Genre', author: 'Updated Author' } }
      put "/api/v1/books/#{book.id}", params: params

      book.reload

      expected_results = {
        id: book.id,
        type: "book",
        attributes: {
          title:      params[:data][:title],
          genre:      params[:data][:genre],
          author:     params[:data][:author],
          created_at: book.created_at,
          updated_at: book.updated_at
        }
      }.as_json.deep_symbolize_keys

      expect(response.status).to eq 200
      parsed_response = JSON.parse(response.body).deep_symbolize_keys[:data]
      expect(parsed_response).to eq expected_results
    end
  end

  describe 'Destroy:' do
    it 'updates and returns the requested book' do
      delete "/api/v1/books/#{book.id}"

      expect(response.status).to eq 204
      expect(Book.find_by(id: book.id)).to_not be
    end
  end
end
