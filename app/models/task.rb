class Task < ActiveRecord::Base
  validates :description, presence: true, length: {in: 1..40}
  belongs_to :user
  enum status: [:start, :process, :done]
  scope :except_done, -> { where.not(status: statuses[:done])}
  before_save :set_status

  def set_status
    self.status = Task.statuses[:start] if self.new_record?
  end
end
