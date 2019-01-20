module Clova
  class Session
    attr_accessor :new, :session_attributes, :session_id, :user

    def initialize(new:, sessionAttributes:, sessionId:, user:)
      @new = new #boolean
      @session_attributes = sessionAttributes #key-value pair object, stores data from previous ClovaResponse' session_attributes
      @session_id = sessionId #String
      @user = User.new(user)
    end


    class User
      attr_accessor :user_id, :access_token

      def initialize(userId:, accessToken:nil)
        @user_id = userId
        @access_token = accessToken
      end
    end
  end
end
