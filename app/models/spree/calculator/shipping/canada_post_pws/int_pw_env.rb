module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntPwEnv < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.PW.ENV'
        end
      end
    end
  end
end
