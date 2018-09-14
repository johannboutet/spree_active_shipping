module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntPwParcel < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.PW.PARCEL'
        end
      end
    end
  end
end
