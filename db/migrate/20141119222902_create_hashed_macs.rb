class CreateHashedMacs < ActiveRecord::Migration
  def change
    create_table :hashed_macs do |t|

      t.timestamps
    end
  end
end
