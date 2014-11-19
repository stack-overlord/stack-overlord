class UpdateGawks < ActiveRecord::Migration
  def change
    add_column :gawks, :type, :string
  end
end
