class ChecklistItem < ApplicationRecord
  self.primary_key = 'item_id'
  belongs_to :checklist, foreign_key: 'checklist_id'
  validates :checklist_id, presence: true
  validates :status, inclusion: { in: [true, false] }
end
