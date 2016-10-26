module ActionRepresenter
  class Base
    include ActionRepresenter::JsonEncodable

    def initialize(model = nil, current_user: nil)
      @current_user = current_user
      @model = model
    end

    class << self
      # @param [Symbol] property_name
      # @param [Hash{Symbol => Object}] options
      def property(property_name, options = {})
        property_definitions << ActionRepresenter::PropertyDefinition.new(
          options.merge(
            parent: self,
            property_name: property_name,
          )
        )
      end

      # @return [Array<JsonWorld::PropertyDefinition>]
      def property_definitions
        @property_definitions ||= []
      end

      # @return [Array<Symbol>]
      def property_names
        property_definitions.map(&:property_name)
      end
    end

    private

    def current_user
      @current_user
    end

    def model
      @model
    end
  end
end
