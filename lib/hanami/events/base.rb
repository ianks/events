module Hanami
  module Events
    class Base
      attr_reader :adapter

      def initialize(adapter_name, options)
        @adapter = Adapter[adapter_name.to_sym].new(options)
      end

      def broadcast(event, **payload)
        adapter.broadcast(event, payload)
      end

      def subscribe(event_name, &block)
        adapter.subscribe(event_name, &block)
      end
    end
  end
end
