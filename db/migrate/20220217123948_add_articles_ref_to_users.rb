class AddArticlesRefToUsers < ActiveRecord::Migration

  def up
    # safe to use: it requires short lock on the table since we don't validate the foreign key
    add_foreign_key :articles, :users, on_delete: :cascade, validate: false
  end
end
