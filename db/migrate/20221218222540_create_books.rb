class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.text :title, null: false, index: true
      t.text :genre, null: true
      t.text :author, null: false, index: true
      t.timestamps
    end
  end
end
