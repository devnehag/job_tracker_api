class Job < ApplicationRecord
  self.primary_key = 'job_id'
  has_one :checklist, foreign_key: 'checklist_id' ,dependent: :destroy
  belongs_to :user, foreign_key: 'user_id'
  validates :user_id,presence: true
  validates :name, presence: true
  validates :company, presence: true
  validates :status, inclusion: { in: ['Open', 'Closed'] }
  #enum status: { open: 'Open', closed: 'Closed' }

end