require 'fast_notas/request'
require 'fast_notas/rest'
require 'fast_notas/paginate'
require 'fast_notas/version'

module FastNotas
  class Client
    include FastNotas::Rest
    include FastNotas::Paginate

    API_ENDPOINT = 'https://api.fastnotas.com/v1'.freeze
    MEDIA_TYPE   = 'application/api+json'.freeze
    USER_AGENT   = "Fast-Notas-Ruby/#{FastNotas::VERSION}".freeze

    attr_accessor :api_key

    def initialize(api_key = nil)
      @api_key = api_key
    end

    # @return [String]
    def api_endpoint
      ENV['FAST_NOTAS_API_ENDPOINT'] || API_ENDPOINT
    end

    # @return [String]
    def default_media_type
      ENV['FAST_NOTAS_MEDIA_TYPE'] || MEDIA_TYPE
    end

    # @return [String]
    def api_key
      @api_key || ENV['FAST_NOTAS_API_KEY']
    end

    # @return [String]
    def user_agent
      ENV['FAST_NOTAS_USER_AGENT'] || USER_AGENT
    end

    # @return [Hash]
    def connection_options
      { headers: { 'User-Agent': user_agent } }
    end
  end
end
