class CreateTables < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :line_number
    end
    create_table :stations do |t|
      t.string :station_name
    end
    create_table :stops do |t|
      t.integer :line_id
      t.integer :station_id
    end
  end
end
