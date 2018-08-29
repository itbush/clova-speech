module Clova
  class Skill
    attr_accessor :request, :response
    def initialize(request)
      @request = request
      @response = response
    end

    def call
      case request.type
      when 'LaunchRequest' then launch_request
      when 'IntentRequest' then intent_request
      when 'EventRequest' then event_request
      when 'SessionEndedRequest' then session_ended_request
      end
      @response.as_json.to_json
    end

    private

    def response
      @response ||= Clova::Response.new
    end
  end
end