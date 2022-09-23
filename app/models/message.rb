# frozen_string_literal: true

class Message < ApplicationRecord
  has_one :value
  belongs_to :inbox
  serialize :header_fields

  after_initialize do |message|
    message.header_fields = [] if message.header_fields.nil?
  end
end
