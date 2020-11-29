# handle shipping errors gracefully during order update
module SpreeActiveShip::OrdersControllerDecorator
  def self.prepended(base)
    base.rescue_from Spree::ShippingError, with: :handle_shipping_error
  end

  def handle_shipping_error(e)
    flash[:error] = e.message
    redirect_back_or_default(root_path)
  end
end

Spree::OrdersController.prepend(SpreeActiveShip::OrdersControllerDecorator)
