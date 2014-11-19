class RenameTypeInGawks < ActiveRecord::Migration
  def change
    rename_column :gawks, :type, :error_class
  end
end
