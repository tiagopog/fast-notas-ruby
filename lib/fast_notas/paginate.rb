module FastNotas
  module Paginate

    def next_page
      if last_request.headers[:total_pages].to_i > last_request.headers[:current_page].to_i
        params = Rack::Utils.parse_query(last_request.request.uri.query)

        params['page'] = (params.try('page')) ? params.try('page').to_i + 1 : 2

        list(params)
      end
    end

  end
end
