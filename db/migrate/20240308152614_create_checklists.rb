class CreateChecklists < ActiveRecord::Migration[7.1]
  def change
    create_table :checklists, id: false do |t|
      t.primary_key :checklist_id
      t.string :title
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
