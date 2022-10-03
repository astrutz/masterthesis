# frozen_string_literal: true

class MakeUuidNullable < ActiveRecord::Migration[7.0]
  def change
    change_column :values, :uuid, :string, null: true
  end
end
