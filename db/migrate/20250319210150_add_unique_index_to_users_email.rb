class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
  end
end
