# frozen_string_literal: true

module ApplicationHelper
  def format_value_amount(amount)
    number_to_currency(amount) || 'kostenlos'
  end
end
