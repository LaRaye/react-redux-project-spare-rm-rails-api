class AddPhoneToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :phone, :bigint
  end
end
