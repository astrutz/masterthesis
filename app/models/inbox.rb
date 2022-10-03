# frozen_string_literal: true

class Inbox < ApplicationRecord
  has_one :recipient
  has_many :messages, dependent: :destroy
  has_many :rules, dependent: :destroy
end
