class Message < ApplicationRecord
  has_one :value
  serialize :header_fields

  after_initialize do |message|
    message.header_fields = [] if message.header_fields == nil
  end
end
