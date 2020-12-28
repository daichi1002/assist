class ChangeColumnNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :comments, :user_id, true
    change_column_null :likes, :user_id, true
  end

  def down
    change_column_null :comments, :user_id, false
    change_column_null :likes, :user_id, false
  end
end
