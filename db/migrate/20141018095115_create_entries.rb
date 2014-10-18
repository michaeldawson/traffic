class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :uid
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
