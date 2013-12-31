class CreateGeoMapStates < ActiveRecord::Migration
  def change
    create_table :geo_map_states do |t|

      t.timestamps
    end
  end
end
