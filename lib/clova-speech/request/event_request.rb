module Clova
  class EventRequest < Request
    attr_reader :namespace, :name, :payload, :event, :type
    def initialize(session:, context:, request:, version:)
      super
      @event = request[:event]
      @namespace = @event[:namespace]
      @name = @event[:name]
      @payload = @event[:payload]

      @type = 'EventRequest'
    end
  end
end
