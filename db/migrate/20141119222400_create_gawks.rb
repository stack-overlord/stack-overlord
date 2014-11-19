class CreateGawks < ActiveRecord::Migration
  def change
    create_table :gawks do |t|
      t.string :message
      t.belongs_to :owner

      t.timestamps
    end
  end
end
