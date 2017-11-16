class AddContactToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :contact, :integer
  end
end
