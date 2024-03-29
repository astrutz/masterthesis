# frozen_string_literal: true

require 'test_helper'

class ValueTest < ActiveSupport::TestCase
  test 'should create value' do
    value = Value.new(sender_address: 'send', recipient_address: '', amount: 1)
    value.save
    assert_equal 5, Value.all.size
    assert_equal 'send', Value.last.sender_address
  end

  test 'should have uuid' do
    value = Value.new(sender_address: '', recipient_address: '', amount: 1)
    value.save
    assert_not_nil value.uuid
  end

  test 'should get correct target date' do
    high_value = Value.new(sender_address: 'one@sender.com', recipient_address: 'one@recipient.com', amount: 50)
    low_value = Value.new(sender_address: 'one@sender.com', recipient_address: 'one@recipient.com', amount: 10)
    high_target_date = high_value.target_date.to_date
    low_target_date = low_value.target_date.to_date
    assert_equal 2.days.from_now.to_date, high_target_date
    assert_equal 2.days.from_now.to_date, low_target_date
  end
end
