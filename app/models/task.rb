class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 25, too_short: 'deve ter pelo menos %{count} caracteres', too_long: 'deve ter no máximo %{count} caracteres' }
  validates :description, presence: true, length: { maximum: 255, too_long: 'deve ter no máximo %{count} caracteres' }
  validates :status, inclusion: { in: [true, false] }

end
