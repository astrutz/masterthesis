# frozen_string_literal: true

require 'test_helper'

module Sender
  class PrioritiesControllerTest < ActionDispatch::IntegrationTest
    test 'should respond with 200' do
      get '/send/priority'
      assert_response :success
    end
  end
end
