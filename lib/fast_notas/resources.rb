module FastNotas
  module Resources

    def list(endpoint, params={})
      request(:get, endpoint, params)
    end

    def show(endpoint, id)
      request(:get, "#{endpoint}/#{id}")
    end

    def create(endpoint, payload)
      request(:post, endpoint, payload)
    end

    def update(endpoint, id, payload)
      request(:put, "#{endpoint}/#{id}", payload)
    end

  end
end


