class Category < ApplicationRecord
  has_many :tasks
  belongs_to :user
  validates :note, presence: true, exclusion: { in: [ nil ] }
  validates :description, presence: true, length: { minimum: 50 }
  validates :number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
