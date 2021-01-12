class AddRegionIdToMatching < ActiveRecord::Migration[6.0]
  def change
    add_column :matchings, :region_id, :integer
  end
end
