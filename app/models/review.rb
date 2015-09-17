class Review < ActiveRecord::Base
  belongs_to :bathroom

  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: "Must be between 1 -5" }
  validates :bathroom_id, presence: true
end
