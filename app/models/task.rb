class Task < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence: true
  validates :status, inclusion: { in: [true, false] }

end
