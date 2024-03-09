class Checklist < ApplicationRecord
  self.primary_key = 'checklist_id'
  belongs_to :job, foreign_key: 'job_id'
  has_many :checklist_items,dependent: :destroy
  validates :job_id,presence: true
  validates :title, presence: true
end
