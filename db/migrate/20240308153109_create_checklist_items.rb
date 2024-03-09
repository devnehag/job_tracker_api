class CreateChecklistItems < ActiveRecord::Migration[7.1]
  def change
    create_table :checklist_items, id: false do |t|
      t.primary_key :item_id
      t.string :description
      t.boolean :status
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
