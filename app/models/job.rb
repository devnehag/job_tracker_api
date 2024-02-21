class Job < ApplicationRecord
  belongs_to :user
  has_one :checklist, dependent: :destroy
end
