class FixClubMembersName < ActiveRecord::Migration
  def change
    rename_column :clubs, :members, :member_number
  end
end
