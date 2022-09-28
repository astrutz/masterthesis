# frozen_string_literal: true

class Message < ApplicationRecord
  has_one :value
  belongs_to :inbox
end
