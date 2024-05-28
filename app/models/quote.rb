# frozen_string_literal: true

class Quote < ApplicationRecord
  belongs_to :company

  validates :name, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  after_create_commit -> { broadcast_prepend_later_to { [quote.company, 'quotes'] } }
  after_update_commit -> { broadcast_replace_later_to { [quote.company, 'quotes'] } }
  after_destroy_commit -> { broadcast_remove_to { [quote.company, 'quotes'] } }
end
