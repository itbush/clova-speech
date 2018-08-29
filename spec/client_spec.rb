require 'spec_helper'

describe Clova::Client do
  let :app_id do
    client.config.application_id
  end

  let :sample_id do
    "com.example.test"
  end

  context '#configure' do
    let :client do
      described_class.new.tap{ |c|
        c.configure do |config|
          config.application_id = sample_id
        end
      }
    end
    it do
      expect(app_id).to eq(sample_id)
    end
  end
end
