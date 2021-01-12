class AddAreaIdToMatching < ActiveRecord::Migration[6.0]
  def change
    add_column :matchings, :area_id, :integer
  end
end
