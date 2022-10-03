# frozen_string_literal: true

class Value < ApplicationRecord
  before_save :generate_uuid
  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
