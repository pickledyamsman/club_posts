class AddTypeIdToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :type_id, :integer
  end
end
