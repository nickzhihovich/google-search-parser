class RenameSearches < ActiveRecord::Migration[5.1]
  def change
    rename_table :searches, :queries
  end
end
