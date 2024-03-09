class RemoveForeignKeyFromJobs < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :jobs, :users
  end
end
