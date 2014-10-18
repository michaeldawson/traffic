class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :uid
      t.string :original_text

      t.string :suburb
      t.float :latitude
      t.float :longitude
      t.text :description
      t.string :streets

      t.timestamps
    end
  end
end