class CreateCars < ActiveRecord::Migration
  def up
    create_table :cars do |t|
    	t.string "Marca"
    	t.string "Modelo"
      t.timestamps null: false
    end
  end
  def down
  	drop_table :cars
  end

end
