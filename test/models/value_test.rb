# frozen_string_literal: true

require 'test_helper'

class ValueTest < ActiveSupport::TestCase
  test 'should create value' do
    value = Value.new(sender_address: '', recipient_address: '', send_at: Time.now, amount: 1)
    value.save
    assert true
  end

  test 'should have uuid' do
    value = Value.new(sender_address: '', recipient_address: '', send_at: Time.now, amount: 1)
    value.save
    assert_not_nil value.uuid
  end
end
