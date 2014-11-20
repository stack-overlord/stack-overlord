class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.belongs_to :gawk
      t.belongs_to :result
      t.boolean :visited

      t.timestamps
    end
  end
end
