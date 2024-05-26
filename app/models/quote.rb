# frozen_string_literal: true

class Quote < ApplicationRecord
  validates :name, presence: true
end
