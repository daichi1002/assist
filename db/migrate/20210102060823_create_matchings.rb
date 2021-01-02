class CreateMatchings < ActiveRecord::Migration[6.0]
  def change
    create_table :matchings do |t|
      t.text :title, null: false
      t.text :detail, null: false
      t.integer :need_id, null: false
      t.date :end_date
      t.string :contact_information, null: false
      t.string :url
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
