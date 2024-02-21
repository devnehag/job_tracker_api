class Checklist < ApplicationRecord
  belongs_to :job
  has_many :checklist_items, dependent: :destroy
end
