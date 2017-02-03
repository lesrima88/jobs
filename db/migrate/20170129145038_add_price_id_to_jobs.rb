class AddPriceIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :price_id, :integer
  end
end
