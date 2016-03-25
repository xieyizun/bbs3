class ChangeColumnTypeForUserAndPost < ActiveRecord::Migration

  def change
    change_column :users, :name, :string, limit: 20, unique: true
    change_column :users, :email, :string, limit: 40, unique: true
    change_column :posts, :content, :text
  end

end
