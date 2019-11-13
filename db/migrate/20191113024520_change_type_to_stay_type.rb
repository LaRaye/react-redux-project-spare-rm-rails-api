class ChangeTypeToStayType < ActiveRecord::Migration[5.2]
  def change
    rename_column :stays, :type, :stay_type
  end
end
