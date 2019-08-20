class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :campaigns, :type, :type_of
  end
end
