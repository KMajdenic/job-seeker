class RenameUserClassfieldsToApplications < ActiveRecord::Migration[7.1]
  def up
    rename_table :applications, :applications
  end
  def down
    rename_table :applications, :applications
  end
end
