class UserBugFix < ActiveRecord::Migration
  def change
    remove_column :users, :type, :string
    add_column :users, :tipo, :string
  end
end
