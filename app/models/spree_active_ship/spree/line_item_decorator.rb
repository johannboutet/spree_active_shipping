# Add product packages relation
module SpreeActiveShip::Spree::LineItemDecorator
  def self.prepended(base)
    base.has_many :product_packages, through: :product
  end
end

::Spree::LineItem.prepend(SpreeActiveShip::Spree::LineItemDecorator)
