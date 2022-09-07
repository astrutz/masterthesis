# frozen_string_literal: true

require 'test_helper'

module Sender
  class PrioritiesControllerTest < ActionDispatch::IntegrationTest
    test 'should respond 200' do
      get '/send/prioritize'
      assert_response :success
    end
  end
end
