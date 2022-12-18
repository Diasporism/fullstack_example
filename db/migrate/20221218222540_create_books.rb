class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.text :title, null: false, index: true
      t.text :description, null: true
      t.text :auther, null: false, index: true
      t.timestamps
    end
  end
end
