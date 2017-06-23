class AddReceivedIdToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :received_id, :integer
  end
end
