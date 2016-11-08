class AddUserIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :add_user_id_to_jobs, :string
    add_column :jobs, :user_id, :integer
  end
end
