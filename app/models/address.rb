class Address < ApplicationRecord

  belongs_to :customer

  def select_address
 	  	[postal_code, address, name].join
  end



end
