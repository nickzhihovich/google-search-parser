class RemoveColumnFromSearch < ActiveRecord::Migration[5.1]
  def change
    remove_column :searches, :result_website
    remove_column :searches, :result_full_link
    remove_column :searches, :result_position
  end
end
