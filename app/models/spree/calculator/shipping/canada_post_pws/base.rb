require_dependency 'spree/calculator'

module Spree
  module Calculator::Shipping
    module CanadaPostPws
      class Base < Spree::Calculator::Shipping::ActiveShipping::Base
        def self.description
          "#{I18n.t('canada_post_pws.prefix')} - #{service_name}"
        end

        def self.service_name
          I18n.t("canada_post_pws.#{service_code.downcase.tr('.', '_')}")
        end

        def carrier
          canada_post_options = {
            api_key: Spree::ActiveShipping::Config[:canada_post_pws_username],
            secret: Spree::ActiveShipping::Config[:canada_post_pws_password],
            customer_number: Spree::ActiveShipping::Config[:canada_post_pws_customer_number],
            language: I18n.locale.to_sym.eql?(:fr) ? 'fr' : 'en',
            endpoint: Spree::ActiveShipping::Config[:test_mode] ? 'https://ct.soa-gw.canadapost.ca/' : 'https://soa-gw.canadapost.ca/'
          }
          ::ActiveShipping::CanadaPostPWS.new(canada_post_options)
        end

        def compute_package(package)
          order = package.order
          stock_location = package.stock_location

          origin = build_location(stock_location)
          destination = build_location(order.ship_address)

          rates_result = retrieve_rates_from_cache(package, origin, destination)

          return nil if rates_result.kind_of?(Spree::ShippingError)
          return nil if rates_result.empty?
          rate = rates_result[self.class.service_code]

          return nil unless rate
          rate = rate.to_f + (Spree::ActiveShipping::Config[:handling_fee].to_f || 0.0)

          # divide by 100 since active_shipping rates are expressed as cents
          rate / 100.0
        end

        private

        def retrieve_rates(origin, destination, shipment_packages)
          response = carrier.find_rates(origin, destination, shipment_packages)
          # turn this beastly array into a nice little hash
          response.rates.each_with_object({}) { |rate, acc| acc[rate.service_code] = rate.price }
        rescue ::ActiveShipping::Error => e

          if e.class == ::ActiveShipping::ResponseError && e.response.is_a?(::ActiveShipping::Response)
            params = e.response.params
            if params.has_key?("Response") && params["Response"].has_key?("Error") && params["Response"]["Error"].has_key?("ErrorDescription")
              message = params["Response"]["Error"]["ErrorDescription"]
              # Canada Post specific error message
            elsif params.has_key?("eparcel") && params["eparcel"].has_key?("error") && params["eparcel"]["error"].has_key?("statusMessage")
              message = e.response.params["eparcel"]["error"]["statusMessage"]
            else
              message = e.message
            end
          else
            message = e.message
          end

          error = Spree::ShippingError.new("#{I18n.t(:shipping_error)}: #{message}")
          Rails.cache.write @cache_key, error #write error to cache to prevent constant re-lookups
          raise error
        end
      end
    end
  end
end
