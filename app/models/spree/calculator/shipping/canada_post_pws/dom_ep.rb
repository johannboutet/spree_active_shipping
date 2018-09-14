module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class DomEp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'DOM.EP'
        end
      end
    end
  end
end
