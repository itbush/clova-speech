require 'spec_helper'

describe Clova::IntentRequest do
  let :json_intent_request do
    {version:"1.0",
     session:{
         new: false,
         sessionAttributes: {},
         sessionId: "a29cfead-c5ba-474d-8745-6c1a6625f0c5",
         user: {
             userId: "U399a1e08a8d474521fc4bbd8c7b4148f",
             accessToken: "XHapQasdfsdfFsdfasdflQQ7"}
     },
     context: {
        System: {
          application: {
            applicationId: "com.yourdomain.extension.pizzabot"},
              user:{
                userId: "U399a1e08a8d474521fc4bbd8c7b4148f",
                accessToken: "XHapQasdfsdfFsdfasdflQQ7"
              },
        device: {
          deviceId: "096e6b27-1717-33e9-b0a7-510a48658a9b",
          display: {
            size: "l100",
            orientation: "landscape",
            dpi: 96,
            contentLayer: {
            width: 640,
            height: 360
            }
          }
        }
        }
     },
        request: {
          type: "IntentRequest",
          intent: {
            name: "OrderPizza",
            slots: {
              pizzaType: {
                name: "pizzaType",
                value:"ペパロニ"}
            }
          }
        }
    }
  end

  let :slot do
    intent_request.find_slot_value_by(slot_name:"pizzaType")
  end

  context '#find_slot_value_by' do
    let :intent_request do
      described_class.new(json_intent_request)
    end

    it do
      expect(slot).to eq("ペパロニ")
    end
  end
end
