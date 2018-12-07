class AddPhotoToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :photo, :string
  end
end
