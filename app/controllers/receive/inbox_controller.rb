# frozen_string_literal: true

module Receive
  class InboxController < ApplicationController
    before_action :authorize
  end
end
