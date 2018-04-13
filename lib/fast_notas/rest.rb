require 'fast_notas/request'

module FastNotas
  module Rest
    def list(endpoint, params = {})
      Request.call(self, :get, endpoint, params)
    end

    def show(endpoint, id)
      Request.call(self, :get, "#{endpoint}/#{id}")
    end

    def create(endpoint, payload)
      Request.call(self, :post, endpoint, payload)
    end

    def update(endpoint, id, payload)
      Request.call(self, :put, "#{endpoint}/#{id}", payload)
    end

    def delete(endpoint, id)
      Request.call(self, :delete, "#{endpoint}/#{id}")
    end
  end
end
