class User < ApplicationRecord
  has_many :categories
  validates :username, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
