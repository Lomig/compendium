# frozen_string_literal: true

# Each page has a header on the same model:
#   - An image representing the resource;
#   - The name of the resource;
#   - A cover.
class PageHeader::Component < ApplicationComponent # rubocop:disable Styles/ClassAndModuleChildren
  delegate :image_path, to: :helpers
  delegate :cl_image_path, to: :helpers

  def initialize(model:)
    super
    @model = model
  end

  def picture_path
    current_picture = picture
    return unless current_picture&.attached?

    cl_image_path(current_picture.key)
  end

  def banner_path
    # current_banner = banner
    return image_path('home/rpg_table.webp') if @model.instance_of?(User)
  end

  def url
    case @model
    when User then avatar_update_user_path
    end
  end

  def field
    case @model
    when User then :avatar
    end
  end

  private

  def picture
    case @model
    when User then @model.avatar
    end
  end

  def banner; end
end
