class AddAvatarColumnToProfiles < ActiveRecord::Migration
  def up
    add_attachment :profiles, :avatar
  end

  def down
    remove_attachment :profiles, :avatar
  end
end
