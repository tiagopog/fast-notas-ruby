require 'fast_notas/default'
require 'fast_notas/rest'
require 'fast_notas/request'
require 'fast_notas/paginate'
require 'fast_notas/resources'

module FastNotas
  class Client
    include FastNotas::Default
    include FastNotas::Rest
    include FastNotas::Paginate
    include FastNotas::Resources

    attr_accessor :api_key

    def initialize(api_key=nil)
      @api_key = api_key
    end
  end
end
