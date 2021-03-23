# frozen_string_literal: true

# Controller helpers to work with Hotwire and ViewComponents
module ComponentHelpers
  include ActionView::RecordIdentifier

  def stream_component(action:, id:, component:, **args)
    stream = turbo_stream.send(action, identifier_from(id)) do
      view_context.render(component::Component.new(**args))
    end

    render turbo_stream: stream
  end

  private

  def identifier_from(id)
    return id if id.instance_of?(String) || id.instance_of?(Symbol)

    dom_id(id)
  end
end
