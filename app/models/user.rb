class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address,uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP}
end