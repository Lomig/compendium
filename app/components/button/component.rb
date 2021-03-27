# frozen_string_literal: true

# Button Component
#  - :link
#  - :submit
class Button::Component < ApplicationComponent
  def initialize(text:, url: '#', type: :link)
    @text = text
    @url = url
    @type = type
  end

  def classes
    ['button', 'inline-block', 'px-6', 'py-2', 'text-xs', 'font-medium', 'leading-6', 'text-center', 'text-white',
     'uppercase', 'transition', 'rounded', 'shadow', 'hover:shadow-lg', 'focus:outline-none'].join(' ')
  end
end
