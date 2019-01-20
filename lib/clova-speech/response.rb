module Clova
  class Response
    attr_accessor :type, :output_speech, :session_attributes, :should_end_session, :version, :card, :directives, :reprompt_speech, :default_language

    def initialize
      @default_language = 'ja'
      @version = Clova::VERSION
      @output_speech = OutputSpeech.new
      @session_attributes = {}
      @directives = []
      @should_end_session = false
      @card = {}
      @reprompt_speech = OutputSpeech.new
    end

    def as_json
      {
          version: version,
          sessionAttributes: session_attributes,
          response: response
      }
    end

    def add_session_attribute(key:, value:)
      @session_attributes[key] = value
    end

    #type either is 'PlainText' or 'URL'
    def add_speech(value, type:'PlainText', language: @default_language)
      @output_speech.add_speech(value: value, type: type, language: language)
    end

    def add_reprompt(value, type: 'PlainText')
      @reprompt_speech.add_speech(value: value, type: type)
    end

    def add_session_attribute(key:, value:)
      @session_attributes[key] = value
    end

    def response
      hash = {
          outputSpeech: output_speech.as_json,
          card: card,
          directives: directives,
          shouldEndSession: should_end_session
      }

      if !@reprompt_speech.empty?
        hash[:reprompt] = {outputSpeech: reprompt_speech.as_json}
      end
      hash
    end
  end
end
