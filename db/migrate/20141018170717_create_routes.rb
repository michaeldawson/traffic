class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :route_from
      t.string :route_to
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end
end
