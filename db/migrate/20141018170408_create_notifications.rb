class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, index: true
      t.references :issue, index: true
      t.text :text
      t.string :ad

      t.timestamps
    end
  end
end
