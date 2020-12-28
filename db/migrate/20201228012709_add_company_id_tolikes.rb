class AddCompanyIdTolikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :likes, :company, foreign_key: true
  end
end
