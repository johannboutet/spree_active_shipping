module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaPwPak < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.PW.PAK'
        end
      end
    end
  end
end
