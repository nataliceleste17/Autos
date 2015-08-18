class CreateTablaParts < ActiveRecord::Migration
  def change
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
