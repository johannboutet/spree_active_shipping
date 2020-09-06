# Add product packages relation
module SpreeActiveShip::Spree::ProductDecorator
  def self.prepended(base)
    base.has_many :product_packages, dependent: :destroy
    base.accepts_nested_attributes_for :product_packages, allow_destroy: true, reject_if: lambda { |pp| (pp[:weight].blank? || (Integer(pp[:weight]) < 1)) }
  end
end

Spree::Product.prepend(SpreeActiveShip::Spree::ProductDecorator)
