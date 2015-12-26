class CreateCounts < ActiveRecord::Migration
  def change
    create_table :counts do |t|
      t.string :date
      t.string :fremont_bridge_nb
      t.string :fremont_bridge_sb

      t.timestamps null: false
    end
  end
end
