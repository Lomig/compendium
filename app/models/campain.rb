# frozen_string_literal: true

class Campain < ApplicationRecord
  belongs_to :game
  belongs_to :game_master, class_name: 'User'
end
