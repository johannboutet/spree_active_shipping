module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class DomRp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'DOM.RP'
        end
      end
    end
  end
end
