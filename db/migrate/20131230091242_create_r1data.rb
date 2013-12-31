class CreateR1data < ActiveRecord::Migration
  def change
    create_table :r1data do |t|

      t.timestamps
    end
  end
end
