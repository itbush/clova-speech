require 'spec_helper'

describe Clova::Session do
  let :json_session do
    {
        new: true,
        sessionAttributes: {
            pizzaType: "ペパロニピザ"
        },
        sessionId: "a29cfead-c5ba-474d-8745-6c1a6625f0c5",
        user: {
            userId: "U399a1e08a8d474521fc4bbd8c7b4148f",
            accessToken: "XHapQasdfsdfFsdfasdflQQ7"
        }
    }
  end

  let :session do
    described_class.new(json_session)
  end

  context '#session_attributes' do
    let :session_attributes do
      session.session_attributes
    end

    it do
      expect(session_attributes[:pizzaType]).to eq('ペパロニピザ')
    end
  end
end
