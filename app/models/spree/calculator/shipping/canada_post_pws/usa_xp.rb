module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class UsaXp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'USA.XP'
        end
      end
    end
  end
end
