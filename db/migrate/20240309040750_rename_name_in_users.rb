class RenameNameInUsers < ActiveRecord::Migration[7.1]
  def change
    ename_column :users, :name, :username
  end
end
