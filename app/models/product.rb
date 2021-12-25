class Product < ApplicationRecord
   attachment :image
   has_many :cart_items
   has_many :order_details


   def with_tax_price
    (price * 1.1).floor
   end
end
