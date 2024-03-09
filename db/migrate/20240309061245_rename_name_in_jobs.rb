class RenameNameInJobs < ActiveRecord::Migration[7.1]
  def change
    rename_column :jobs, :name, :cname
  end
end
