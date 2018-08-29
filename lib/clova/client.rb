module Clova
  class Client

    attr_accessor :config

    def initialize
      @config = Config.new
    end

    def configure
      yield(config)
    end

    def build_response(raw_request)
      request = self.build_request(raw_request)
      skill = config.skill_class.new(request)
      skill.call
    end

    #raw_request: the HTTPRequest that is recieved, including headers, body, before deserialization
    def build_request(raw_request)
      validator = Clova::Validator.new(app_id: config.application_id)
      validator.validate(raw_request)

      raw_request.body.rewind #allows for the request to be read a second time
      request = JSON.parse(raw_request.body.read.to_s, :symbolize_names => true)
      type = request[:request].fetch(:type)

      case type
      when 'IntentRequest'
        IntentRequest.new(request)
      when 'EventRequest'
        EventRequest.new(request)
      when 'LaunchRequest'
        LaunchRequest.new(request)
      when 'SessionEndedRequest'
        SessionEndedRequest.new(request)
      else
        raise "Request Invalid (no matching type)"
      end
    end
  end
end