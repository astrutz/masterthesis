class Recipient < ApplicationRecord
  has_secure_password

  validates :email_address, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
