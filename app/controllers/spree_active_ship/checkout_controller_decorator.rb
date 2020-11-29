# handle shipping errors gracefully during checkout
module SpreeActiveShip::CheckoutControllerDecorator
  def self.prepended(base)
    base.rescue_from Spree::ShippingError, with: :handle_shipping_error
  end

  def handle_shipping_error(e)
    flash[:error] = e.message
    redirect_to checkout_state_path(:address)
  end
end

Spree::CheckoutController.prepend(SpreeActiveShip::CheckoutControllerDecorator)
