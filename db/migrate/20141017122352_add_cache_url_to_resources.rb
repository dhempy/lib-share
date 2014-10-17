class AddCacheUrlToResources < ActiveRecord::Migration
  def change
    add_column :resources, :cache_url, :string
  end
end
