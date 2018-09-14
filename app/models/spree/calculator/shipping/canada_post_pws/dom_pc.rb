module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class DomPc < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'DOM.PC'
        end
      end
    end
  end
end
