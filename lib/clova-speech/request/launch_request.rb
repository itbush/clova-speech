module Clova
  class LaunchRequest < Request
    attr_reader :type
    def initialize(session:, context:, request:, version:)
      super
      @type = 'LaunchRequest'
    end
  end
end
