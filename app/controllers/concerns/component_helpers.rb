# frozen_string_literal: true

# Controller helpers to work with Hotwire and ViewComponents
module ComponentHelpers
  def stream_component(action:, id:, component:, **args)
    stream = turbo_stream.send(action, id) do
      view_context.render(component::Component.new(**args))
    end

    render turbo_stream: stream
  end
end
