require 'spec_helper'

describe Clova::Validator do
  describe '#valid_app_id?' do
    let :json do
      { context: { System: { application: { applicationId: app_id } } } }.to_json
    end

    let :validator do
      described_class.new(app_id: 'com.example.isaiah_test')
    end

    let :is_valid do
      validator.valid_app_id?(json)
    end

    context 'app_id is correct' do
      let :app_id do
        'com.example.isaiah_test'
      end

      it do
        expect(is_valid).to eq(true)
      end
    end

    context 'app_id is not correct' do
      let :app_id do
        'bad_test'
      end

      it do
        expect(is_valid).to eq(false)
      end
    end
  end
end