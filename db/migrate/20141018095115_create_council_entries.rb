class CreateCouncilEntries < ActiveRecord::Migration
  def change
    create_table :councilentries do |t|
      t.string :uid
      t.string :title
      t.text :summary
      
      t.string :suburb
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
