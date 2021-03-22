# frozen_string_literal: true

class Navbar::Connect::Component < ApplicationComponent
  def initialize(user:)
    @user = user
  end

  def render?
    @user.blank?
  end
end
