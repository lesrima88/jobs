class AddCityIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :city_id, :integer
  end
end
