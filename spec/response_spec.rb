require 'spec_helper'

describe Clova::Response do
  describe '#response' do
    context 'Speech with reprompt' do
      let :response do
        described_class.new.tap { |o|
          o.add_speech("Hello, world!!!")
          o.add_reprompt("Good night, world!!!")
        }
      end

      it do
        #Note that when reprompt is used, shouldEndSession should be set to false
        expect(response.response).to eq(
                                         outputSpeech:{
                                             type: 'SimpleSpeech',
                                             values: { lang: 'ja', type: 'PlainText', value: 'Hello, world!!!'}},
                                         card: {},
                                         directives: [],
                                         shouldEndSession: false,
                                         reprompt: {
                                             outputSpeech:{
                                                 type: 'SimpleSpeech',
                                                 values: { lang: 'ja', type: 'PlainText', value: 'Good night, world!!!'}}
                                         })
      end
    end

    context 'Speech without reprompt' do
      let :response do
        described_class.new.tap{|o|
          o.add_speech("Hello, world!!!")}
      end
      it do
        expect(response.response).to eq(
                                         outputSpeech:{
                                             type: 'SimpleSpeech',
                                             values: { lang: 'ja', type: 'PlainText', value: 'Hello, world!!!'}},
                                         card: {},
                                         directives: [],
                                         shouldEndSession: false)
      end
    end
  end
  describe '#as_json' do
    context 'Properly adding Session Attributes' do
      let :response do
        described_class.new.tap{|o|
          o.add_session_attribute(key: "IntentName", value: "PizzaOrder")
          o.add_session_attribute(key: "PizzaType", value: "ペパロニ")}
      end

      it do
        expect(response.as_json[:sessionAttributes]).to eq(
                                                            {"IntentName"=> "PizzaOrder",
                                                             "PizzaType"=> "ペパロニ"})
      end
    end
  end
end
