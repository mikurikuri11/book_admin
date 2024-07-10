class AddPublisherIdToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :publisher, foreign_key: true
    change_column :books,r:integer, null: false
  end
end
