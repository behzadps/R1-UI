class CreateChartdetails < ActiveRecord::Migration
  def change
    create_table :chartdetails do |t|

      t.timestamps
    end
  end
end
