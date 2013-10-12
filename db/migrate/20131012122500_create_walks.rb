class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
      t.belongs_to :user
      t.string :starting_point
      t.string :waypoint_1
      t.string :waypoint_2
      t.string :distance
      t.timestamps
    end
  end
end