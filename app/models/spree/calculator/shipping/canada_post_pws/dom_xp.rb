module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class DomXp < Spree::Calculator::Shipping::CanadaPostPws::Base
        def self.service_code
          'DOM.XP'
        end
      end
    end
  end
end
