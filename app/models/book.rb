class Book < ApplicationRecord
  def to_json_api
    BookSerializer.new(self).serializable_hash
  end
end
