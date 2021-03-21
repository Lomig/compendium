# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :campains, dependent: :restrict_with_error
end
