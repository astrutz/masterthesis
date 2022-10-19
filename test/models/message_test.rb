# frozen_string_literal: true

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'should create message' do
    message = Message.new(inbox: inboxes(:one), sender_address: '', recipient_address: '', subject: '', send_at: Time.now, content: '')
    message.save
    assert_equal 6, Message.all.size
    assert_equal inboxes(:one), Message.last.inbox
  end

  test 'should fill messages with amount' do
    messages_filled_sorted = Message.with_value.map { |m| m['value_header'].to_i }.sort
    assert_equal [0, 3, 6, 15, 20], messages_filled_sorted
  end

  test 'should group messages by multiple editing_performance' do
    messages_grouped = Message.group_by_amount(2)

    assert_equal messages_grouped.size, 3
    assert_equal messages_grouped, [[messages(:four), messages(:one)], [messages(:two), messages(:three)], [messages(:five)]]
  end

  test 'should group messages by singular editing_performance' do
    messages_grouped = Message.group_by_amount(1)

    assert_equal messages_grouped.size, 5
    assert_equal messages_grouped, [[messages(:four)], [messages(:one)], [messages(:two)], [messages(:three)], [messages(:five)]]
  end

  test 'should only show unprocessed messages in scope' do
    assert_equal 3, Message.unprocessed.size
  end

  test 'should only show processed messages in scope' do
    assert_equal 2, Message.processed.size
  end

  test 'should only show messages matching rules in scope' do
    assert_equal 1, Message.matches_rules.size
  end
end
