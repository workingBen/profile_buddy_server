class RemoveUsernameFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :username
  end
end
