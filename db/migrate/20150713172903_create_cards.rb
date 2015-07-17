class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :cnumber
      t.string :ctype
      t.integer :exmonth
      t.integer :exyear
      
      t.timestamps null: false
    end
  end
end
