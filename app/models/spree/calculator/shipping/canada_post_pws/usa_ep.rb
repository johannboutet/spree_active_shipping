module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaEp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.EP'
        end
      end
    end
  end
end
