class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string     :title,            null: false
      t.integer    :genre_id,         null: false
      t.integer    :type_id,          null: false
      t.integer    :area_id,          null: false
      t.string     :maximum_price,    null: false
      t.date       :start_date,       null: false
      t.date       :end_date,         null: false
      t.text       :information,      null: false
      t.string     :url,              null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
