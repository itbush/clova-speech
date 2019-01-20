module Clova
  class OutputSpeech
    def initialize
      @lang = 'ja'
      @speech_info_objects = []
    end

    def as_json
      {type: type, values: values}
    end

    def empty?
      @speech_info_objects.empty?
    end

    def add_speech(value:, type:'PlainText', language: @lang)
      case type
      when 'PlainText'
        lang = language
      when 'URL'
        lang = ''
      end
      @speech_info_objects << SpeechInfoObject.new(lang: lang, value:value, type:type)
    end

    def simple_speech?
      @speech_info_objects.one?
    end

    def speech_list?
      !simple_speech?
    end

    def type
      case
      when simple_speech? then 'SimpleSpeech'
      when speech_list? then 'SpeechList'
      else
        raise 'Type not found'
      end
    end

    def values
      case
      when simple_speech?
        @speech_info_objects.first.as_json
      when speech_list?
        @speech_info_objects.map(&:as_json)
      end
    end

    class SpeechInfoObject
      attr_accessor :type, :lang, :value

      def initialize(lang:, value:, type:)
        @lang = lang
        @type = type
        @value = value
      end

      def as_json
        {type: type, lang: lang, value: value}
      end
    end
  end
end
