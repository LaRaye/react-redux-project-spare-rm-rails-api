class RemovePhoneFromHosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :hosts, :phone
  end
end
