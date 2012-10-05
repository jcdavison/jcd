class CreateDisruptions < ActiveRecord::Migration
  def change
    create_table :disruptions do |t|
      t.string :name
      t.string :sustainable
      t.string :disruptive

      t.timestamps
    end
  end
end
