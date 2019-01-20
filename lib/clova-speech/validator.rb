require 'openssl'
require 'base64'

# Each request contains an application_id, which mirrors the extension_id the developer
# sets on the Clova development portal. Every request is also signed using RSA encryption

module Clova
  class Validator
    attr_accessor :app_id

    # raw_request: is the body of the incoming request, in the form of String
    # request_sign: is the signature, found in the header of the request under "SignatureCEK"
    def initialize(app_id:)
      @app_id = app_id
    end

    def validate(raw_request)
      request_body_str = raw_request.body.read
      request_sign = raw_request.env["HTTP_SIGNATURECEK"]

      sign_result = valid_signature?(request_body_str, request_sign)
      app_id_result = valid_app_id?(request_body_str)

      raise 'Bad Request: invalid signature' unless sign_result
      raise 'Bad Request: invalid application id' unless app_id_result

      sign_result && app_id_result
    end

    def valid_signature?(request_body_str, request_sign)
      key = OpenSSL::PKey::RSA.new clova_public_key
      key.public_key.verify(OpenSSL::Digest::SHA256.new, Base64.decode64(request_sign), request_body_str)
    end

    def valid_app_id?(request_body_str)
      request = JSON.parse(request_body_str)
      request_app_id = request['context']['System']['application']['applicationId']
      app_id == request_app_id
    end

    private
    def clova_public_key
      <<~PEM.chomp
        -----BEGIN PUBLIC KEY-----
        MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwiMvQNKD/WQcX9KiWNMb
        nSR+dJYTWL6TmqqwWFia69TyiobVIfGfxFSefxYyMTcFznoGCpg8aOCAkMxUH58N
        0/UtWWvfq0U5FQN9McE3zP+rVL3Qul9fbC2mxvazxpv5KT7HEp780Yew777cVPUv
        3+I73z2t0EHnkwMesmpUA/2Rp8fW8vZE4jfiTRm5vSVmW9F37GC5TEhPwaiIkIin
        KCrH0rXbfe3jNWR7qKOvVDytcWgRHJqRUuWhwJuAnuuqLvqTyAawqEslhKZ5t+1Z
        0GN8b2zMENSuixa1M9K0ZKUw3unzHpvgBlYmXRGPTSuq/EaGYWyckYz8CBq5Lz2Q
        UwIDAQAB
        -----END PUBLIC KEY-----
      PEM
    end
  end
end
