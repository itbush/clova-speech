module Clova
  class SessionEndedRequest < Request
     attr_accessor :type

    def initialize(session:, context:, request:, version:)
      super
      @type = 'SessionEndedRequest'
    end
  end
end
