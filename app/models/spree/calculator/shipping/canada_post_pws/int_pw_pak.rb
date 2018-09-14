module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntPwPak < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.PW.PAK'
        end
      end
    end
  end
end
