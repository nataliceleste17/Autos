class CreateParts < ActiveRecord::Migration
  def up
    create_table :parts do |t|
    	t.string "Nombre"
    	t.integer "Cantidad"
      t.timestamps null: false
    end
  end

  def down
  	drop_table :parts 
  end

end
