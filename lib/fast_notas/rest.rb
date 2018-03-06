Dir[File.expand_path("../rest/**/*.rb", __FILE__)].each do |file|
  require file
end

module FastNotas
  module Rest
    include FastNotas::Rest::Company

    def resource_method?(method_name)
      FastNotas::Resources.public_instance_methods.include? method_name.to_sym
    end

    def entity?(entity_name)
      FastNotas::Rest.constants.include? entity_name.to_sym
    end

    def method_missing(method_name, *args)
      method_array = method_name.to_s.split('_')

      raise NoMethodError unless method_array.size > 1

      resource_name = method_array[0]
      entity_name = method_array.from(1).join('_').singularize.capitalize

      raise NoMethodError unless resource_method?(resource_name)

      raise NoMethodError unless entity?(entity_name)

      endpoint = send("#{entity_name.downcase}_endpoint")

      send(resource_name, endpoint , *args)

    end
  end
end