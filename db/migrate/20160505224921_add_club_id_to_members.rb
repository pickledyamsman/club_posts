class AddClubIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :club_id, :integer
  end
end
