module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntIpSurf < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.IP.SURF'
        end
      end
    end
  end
end
