class AddSlugToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :slug, :string
    add_index :requests, :slug, unique: true
  end
end
