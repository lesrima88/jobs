class DropPersonalMessages < ActiveRecord::Migration
  def change
  	drop_table :personal_messages
  end
end
