class Item < ApplicationRecord
  has_many :cart_items
  has_many :ordeer_details

end
