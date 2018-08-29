module Clova
  class IntentRequest < Request
    attr_accessor :name, :slots, :intent, :type
    def initialize(session:, context:, request:, version:)
      super
      @intent = request[:intent]
      @name = @intent[:name]
      @slots = @intent[:slots]

      @type = 'IntentRequest'
    end

    def find_slot_value_by(slot_name)
      name = slot_name
      name = name.to_sym if name.is_a?(String)
      @slots[name][:value]
    end
  end
end
