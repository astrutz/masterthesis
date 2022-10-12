# frozen_string_literal: true

require 'test_helper'

module Send
  class PrioritiesControllerTest < ActionDispatch::IntegrationTest
    test '/send/priority should respond with 200' do
      get '/send/priority'
      assert_response :success
    end
  end
end
