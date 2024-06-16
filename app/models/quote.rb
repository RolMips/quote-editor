# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :company
  has_many :line_item_dates, dependent: :destroy

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  broadcasts_to ->(quote) { [quote.company, 'quotes'] }, inserts_by: :prepend

  def total_price
    line_item_dates.includes(:line_items).sum { |lid| lid.line_items.sum(&:total_price) }
  end
end
