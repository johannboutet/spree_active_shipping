module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntTp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.TP'
        end
      end
    end
  end
end
