require 'oj'

module FastNotas
  class Response
    attr_reader :raw_response

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def data
      Oj.load(raw_response.body)
    end

    def errors
      data if fail?
    end

    def success?
      (200...300).include?(raw_response.code)
    end

    def fail?
      !success?
    end

    def code
      raw_response.code
    end

    alias status code
  end
end
