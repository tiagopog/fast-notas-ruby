require 'fast_notas/default'
require 'fast_notas/request'
require 'fast_notas/rest'

module FastNotas
  class Client
    include FastNotas::Default
    include FastNotas::Rest
    include FastNotas::Request

    attr_accessor :api_key

    def initialize(api_key=nil)
      @api_key = api_key
    end
  end
end