class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
