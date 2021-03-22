# frozen_string_literal: true

# Serve Static Pages
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
end
