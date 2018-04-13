require 'oj'

module FastNotas
  class Response
    attr_reader :raw_response

    delegate :code, to: :@response

    alias status code

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def body
      Oj.load(raw_response.body)
    end

    def success?
      (200...300).include?(raw_response.code)
    end

    def fail?
      !success?
    end
  end
end
