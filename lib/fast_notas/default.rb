require 'fast_notas/version'

module FastNotas
  module Default
    # Default API endpoint
    API_ENDPOINT = 'https://api.fastnotas.com/v1'.freeze

    # Default media type
    MEDIA_TYPE   = 'application/api+json'.freeze

    # Default User Agent header string
    USER_AGENT   = "Fast-Notas-Ruby/#{FastNotas::VERSION}".freeze


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
      ENV['FAST_NOTAS_API_KEY'] || @api_key
    end

    # Default User-Agent header string from ENV or USER_AGENT
    # @return [String]
    def user_agent
      ENV['FAST_NOTAS_USER_AGENT'] || USER_AGENT
    end

    def connection_options
      {
        headers: {
          'User-Agent': user_agent
        }
      }
    end

  end
end