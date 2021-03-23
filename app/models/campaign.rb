# frozen_string_literal: true

class Campaign < ApplicationRecord
  belongs_to :game
  belongs_to :game_master, class_name: 'User'
end
