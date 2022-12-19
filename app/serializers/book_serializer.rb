class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :genre, :author, :created_at, :updated_at
end
