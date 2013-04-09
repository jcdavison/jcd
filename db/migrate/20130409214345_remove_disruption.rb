class RemoveDisruption < ActiveRecord::Migration
  def change
    drop_table :disruptions
  end

end
