require 'active_support'
require 'active_support/core_ext'
require 'fast_notas/paginate'
require 'fast_notas/resources'

module FastNotas
  module Request

    include FastNotas::Paginate
    include FastNotas::Resources

    attr_accessor :last_request

    def http_status_code
      last_request.code
    end

    def body
      JSON.parse(last_request.body)
    end

    private

    def request(method= :get, endpoint=nil, params={}, payload=nil)
      begin
        @last_request = RestClient::Request.execute(
          method: method,
          url: "#{api_endpoint}/#{endpoint}?#{params.to_query}",
          payload: payload,
          user: api_key,
          headers: connection_options[:headers]
        )

        body
      rescue StandardError => e
        @last_request = e.try(:response)

        false
      end
    end
  end
end
