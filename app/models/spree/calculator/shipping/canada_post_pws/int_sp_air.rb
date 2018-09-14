module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntSpAir < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.SP.AIR'
        end
      end
    end
  end
end
