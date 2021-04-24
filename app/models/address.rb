class Address < ApplicationRecord

  belongs_to :customer

  validates :customer_id, presence: true
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

  def select_address
 	  	[postal_code, address, name].join
  end



end
