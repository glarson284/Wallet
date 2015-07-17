class RenameTable < ActiveRecord::Migration
  def change
    rename_table :usercards, :user_cards
  end
end
