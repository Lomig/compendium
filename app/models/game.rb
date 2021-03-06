# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :campaigns, dependent: :restrict_with_error
end
