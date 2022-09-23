class Inbox < ApplicationRecord
  has_one :recipient
  has_many :messages
  has_many :rules
end
