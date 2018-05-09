class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.string :website
      t.string :full_link
      t.string :position

      t.timestamps
    end
  end
end
