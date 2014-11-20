class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.belongs_to :address
      t.belongs_to :gawk

      t.timestamps
    end
  end
end
