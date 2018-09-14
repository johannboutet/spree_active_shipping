module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntSpSurf < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.SP.SURF'
        end
      end
    end
  end
end
