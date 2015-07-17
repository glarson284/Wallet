class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.string :phone
      t.string :fname
      t.string :lanme
      t.decimal :balance
      
      t.timestamps null: false
    end
  end
end
