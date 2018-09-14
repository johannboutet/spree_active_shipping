module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntIpAir < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.IP.AIR'
        end
      end
    end
  end
end
