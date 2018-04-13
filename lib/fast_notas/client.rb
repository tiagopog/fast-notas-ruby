require 'fast_notas/rest'
require 'fast_notas/request'
require 'fast_notas/paginate'
require 'fast_notas/resources'
require 'fast_notas/version'

module FastNotas
  class Client
    include FastNotas::Rest
    include FastNotas::Paginate
    include FastNotas::Resources

    # Default API endpoint
    API_ENDPOINT = 'https://api.fastnotas.com/v1'.freeze
    # Default media type
    MEDIA_TYPE = 'application/api+json'.freeze
    # Default User Agent header string
    USER_AGENT = "Fast-Notas-Ruby/#{FastNotas::VERSION}".freeze

    attr_accessor :api_key

    def initialize(api_key = nil)
      @api_key = api_key
    end

    # Default api endpoint string from ENV or API_ENDPOINT
    # @return [String]
    def api_endpoint
      ENV['FAST_NOTAS_API_ENDPOINT'] || API_ENDPOINT
    end

    # Default media type header string from ENV or MEDIA_TYPE
    # @return [String]
    def default_media_type
      ENV['FAST_NOTAS_MEDIA_TYPE'] || MEDIA_TYPE
    end

    # Default user KEY string from ENV
    # @return [String]
    def api_key
      @api_key || ENV['FAST_NOTAS_API_KEY']
    end

    # Default User-Agent header string from ENV or USER_AGENT
    # @return [String]
    def user_agent
      ENV['FAST_NOTAS_USER_AGENT'] || USER_AGENT
    end

    def connection_options
      { headers: { 'User-Agent': user_agent } }
    end
  end
end
