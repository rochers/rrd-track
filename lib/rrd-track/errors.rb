module RRD
  class Error < StandardError
    attr_reader :code, :description

    def initialize(code, description)
      super(description)
      @code = code
      @description = description
    end

    class << self
      def for_code(code)
        case code
        when '100'; UsernameNotFoundError
        when '110'; PasswordNotFoundError
        when '120'; TrackingNumberNotFoundError
        when '130'; AuthenticationError
        when '200'; ShippingSiteError
        when '300'; DatabaseError
        when '400'; BadTrackingNumberError
        else      ; Error
        end
      end
    end
  end

  class ValidationError < Error; end
  class UsernameNotFoundError < ValidationError; end
  class PasswordNotFoundError < ValidationError; end
  class TrackingNumberNotFoundError < ValidationError; end
  class AuthenticationError < Error; end
  class ShippingSiteError < Error; end
  class DatabaseError < Error; end
  class BadTrackingNumberError < Error; end
end