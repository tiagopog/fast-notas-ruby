require 'rest-client'
require 'fast_notas/response'

module FastNotas
  module Request
    module_function

    # @return [String]
    def to_param(value)
      slug = value.to_s.downcase.gsub(/'/, '').gsub(/[^a-z0-9]+/, '-')
      slug.chop! if slug[-1] == '-'
      slug
    end

    # @return [String]
    def to_query(params)
      params.map do |key, value|
        [CGI.escape(to_param(key)), CGI.escape(to_param(value))].join('=')
      end.join('&')
    end

    # @return [Hash]
    def build_request_for(client, method, path, params, payload)
      {
        method: method,
        url: [client.api_endpoint, path, "?#{to_query(params)}"].join('/'),
        payload: payload,
        user: client.api_key,
        headers: client.connection_options[:headers]
      }
    end

    # @return [FastNotas::Response]
    def call(client, method = :get, path = '', params = {}, payload = nil)
      request_data = build_request_for(client, method, path, params, payload)
      response     = RestClient::Request.execute(request_data)
      FastNotas::Response.new(response)
    rescue RestClient::NotFound,
           RestClient::UnprocessableEntity => e
      raise(e) unless e.respond_to?(:response)
      FastNotas::Response.new(e.response)
    end
  end
end
