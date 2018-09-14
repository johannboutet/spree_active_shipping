module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaSpAir < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.SP.AIR'
        end
      end
    end
  end
end
