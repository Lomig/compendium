# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :led_campains, class_name: 'Campain',
                          foreign_key: 'game_master_id',
                          inverse_of: :game_master,
                          dependent: :nullify
end
