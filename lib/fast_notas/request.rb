require 'active_support'
require 'active_support/core_ext'
require 'rest-client'
require 'fast_notas/response'

module FastNotas
  module Request
    module_function

    def build_request_for(client, method, path, params, payload)
      {
        method: method,
        url: [Default.api_endpoint, path, "?#{params.to_query}"].join('/'),
        payload: payload,
        user: client.api_key,
        headers: Default.connection_options[:headers]
      }
    end

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
