require 'spec_helper'

describe Clova::OutputSpeech do
  describe '#as_json' do
    let :json do
      output_speech.as_json
    end

    context 'SimpleSpeech' do
      let :output_speech do
        described_class.new.tap { |o|
          o.add_speech(value:'Hello')
        }
      end

      it do
        expect(json).to eq(
          type: 'SimpleSpeech',
          values: { lang: 'ja', type: 'PlainText', value: 'Hello' }
         )
      end
    end

    context 'SpeechList' do
      let :output_speech do
        described_class.new.tap { |o|
          o.add_speech(value:'Hello')
          o.add_speech(value:'https://example.com', type:"URL")
        }
      end

      it do
        expect(json).to eq({
          type: 'SpeechList',
          values: [
            { lang: 'ja', type: 'PlainText', value: 'Hello' },
            { lang: '', type: 'URL', value: 'https://example.com' },
           ]
         })
      end
    end
  end
end
