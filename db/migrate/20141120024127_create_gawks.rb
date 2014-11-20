class CreateGawks < ActiveRecord::Migration
  def change
    create_table :gawks do |t|
      t.belongs_to :address

      t.string :message
      t.string :error_class

      t.timestamps
    end
  end
end
