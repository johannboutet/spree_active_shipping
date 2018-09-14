module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaTp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.TP'
        end
      end
    end
  end
end
