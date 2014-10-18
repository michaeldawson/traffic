class CreateTwitterEntries < ActiveRecord::Migration
  def change
    create_table :twitter_entries do |t|
      t.string :uid
      t.string :original_text

      t.string :suburb
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end