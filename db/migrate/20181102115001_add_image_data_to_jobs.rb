class AddImageDataToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :image_data, :string
  end
end
