class AddPriceIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :price_id, :integer
  end
end
