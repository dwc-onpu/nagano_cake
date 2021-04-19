class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy

 #enum status: { 販売中: true, 販売停止中: false }

end

            #<%= if item.is_active == true
               #puts "販売中"
              #elsif item.is_active == false
               #puts "販売停止中"
              #end  %>
