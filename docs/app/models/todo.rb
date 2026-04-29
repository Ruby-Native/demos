class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  scope :pending, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil).order(completed_at: :desc) }
  scope :due_today, -> { pending.where(due_at: Date.current.all_day) }

  def completed?
    completed_at.present?
  end
end
