module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaPwParcel < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.PW.PARCEL'
        end
      end
    end
  end
end
