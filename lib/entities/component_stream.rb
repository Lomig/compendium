# frozen_string_literal: true

# ComponentStream is a class representing a Hotwire Turbo stream to render.
# It interfaces with View Components to be able to render them without a turbo_stream view
class ComponentStream
  include ActionView::RecordIdentifier

  private

  attr_accessor :streams, :controller

  public

  def initialize(controller:)
    @controller = controller
    @streams = []
  end

  def add(action:, id:, component:, **args)
    stream = controller.send(:turbo_stream).send(action, identifier_from(id)) do
      controller.view_context.render(component::Component.new(**args))
    end

    streams << stream
    self
  end

  def render
    controller.render turbo_stream: streams
  end

  private

  def identifier_from(id)
    return id if id.instance_of?(String) || id.instance_of?(Symbol)

    dom_id(id)
  end
end
