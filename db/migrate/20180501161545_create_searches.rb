class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.string :search_engine
      t.string :result_website
      t.string :result_full_link
      t.string :result_position

      t.timestamps
    end
  end
end
