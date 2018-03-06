module FastNotas
  module Rest

    # Methods for the company API
    # @see http://docs.api.fastnotas.com/#companies
    module Company

      def my_company
        list('company')
      end

      private

      def company_endpoint
        'companies'
      end

    end
  end
end
