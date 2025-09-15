class Task < ApplicationRecord
  belongs_to :category
  validates :taskname, presence: true
  validates :details, presence: true#, length: { minimum: 10 }
  validates :duedate, presence: true
end
