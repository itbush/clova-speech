module Clova
  class Request
    attr_reader :session, :context, :version

    def initialize(session:, context:, request:, version:)
      @context = context
      @session = Session.new(session)
      @version = version
    end

    def session_attributes
      @session.session_attributes
    end
  end
end
