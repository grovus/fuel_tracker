class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :make
      t.string :model
      t.integer :year
      t.integer :odometer
      t.integer :user_id

      t.timestamps
    end
    add_index :vehicles, [:user_id, :year]
  end
end
