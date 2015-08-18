class CreateCars < ActiveRecord::Migration
  def up
    create_table :cars do |t|
    	t.string "Marca"
    	t.string "Modelo"
    	t.integer "id_auto"
      t.timestamps null: false
    end
  end
  def down

  end

end
