# frozen_string_literal: true

class Recipient < ApplicationRecord
  belongs_to :inbox
  has_secure_password

  validates :email_address, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
