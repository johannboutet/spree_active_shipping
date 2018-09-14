module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaPwEnv < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.PW.ENV'
        end
      end
    end
  end
end
