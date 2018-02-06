class AddCompletedAtToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :completed_at, :datetime
  end
end
