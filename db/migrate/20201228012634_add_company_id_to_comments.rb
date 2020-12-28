class AddCompanyIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :company, foreign_key: true
  end
end
