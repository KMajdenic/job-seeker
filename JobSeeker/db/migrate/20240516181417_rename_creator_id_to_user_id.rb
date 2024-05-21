class RenameCreatorIdToUserId < ActiveRecord::Migration[7.1]
  def up
    rename_column :classfields, :creator_id, :user_id
  end

  def down
    rename_column :classfields, :user_id, :creator_id
  end
end
