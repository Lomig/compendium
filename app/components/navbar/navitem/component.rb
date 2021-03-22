# frozen_string_literal: true

class Navbar::Navitem::Component < ApplicationComponent
  def initialize(name:, url:, highlight: true)
    @name = name
    @url = url
    @highlight = highlight
  end
end
