class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :description
      t.integer :members

      t.timestamps null: false
    end
  end
end
