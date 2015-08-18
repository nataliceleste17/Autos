class DropTablaParts < ActiveRecord::Migration
  def down
  	drop_table :parts 
  end
end
