class AddPhoneToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :phone, :string
  end
end
