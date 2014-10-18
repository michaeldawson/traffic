class CreateIssuesStreets < ActiveRecord::Migration
  def self.up
    create_table :issues_streets, :id => false do |t|
        t.references :issue
        t.references :street
    end
    add_index :issues_streets, [:issue_id, :street_id]
    add_index :issues_streets, :street_id
  end

  def self.down
    drop_table :issues_streets
  end
end
