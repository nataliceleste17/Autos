class CreateTablaParts2 < ActiveRecord::Migration
  def up
    create_table :parts do |t|
		t.string "Nombre"
    	t.integer "Cantidad"
    	t.string "Car_id"
      	t.timestamps null: false
    end
  end

  def down
  	drop_table :parts
  end
end
