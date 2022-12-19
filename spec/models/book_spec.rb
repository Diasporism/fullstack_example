RSpec.describe Book do
  let(:book) { FactoryBot.create(:book) }

  describe '.to_json_api' do
    it 'returns a JSON API compliant hash of the record' do
      expected_results = {
        data: {
          id: book.id,
          type: :book,
          attributes: {
            title: book.title,
            genre: book.genre,
            author: book.author,
            created_at: book.created_at,
            updated_at: book.updated_at
          }
        }
      }
      expect(book.to_json_api).to eq(expected_results)
    end
  end
end
