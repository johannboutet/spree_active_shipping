module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class IntXp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'INT.XP'
        end
      end
    end
  end
end
