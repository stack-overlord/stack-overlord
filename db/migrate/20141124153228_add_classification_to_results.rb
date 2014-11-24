class AddClassificationToResults < ActiveRecord::Migration
  def change
    add_column :results, :classification, :string
  end
end
