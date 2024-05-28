# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :company
  # Others devise modules available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable,:registerable
  devise :database_authenticatable, :validatable

  def name
    email.split('@').first.capitalize
  end
end
