module Clova
  class Config
    attr_accessor :application_id, :skill_class

    def initialize
      @application_id = nil
      @skill_class = nil
    end
  end
end
