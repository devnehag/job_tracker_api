
  class RemoveForeignKeys < ActiveRecord::Migration[7.1]
    def change
      remove_foreign_key :checklists, :jobs
      remove_foreign_key :jobs, :users
    end
  end

