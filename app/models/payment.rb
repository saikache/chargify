class Payment < ActiveRecord::Base
  attr_accessible :billing_zip, :card_number, :cvv, :email_address, 
  :expiration_date, :first_name, :first_name_on_card, :last_name, :last_name_on_card,
   :organization, :string, :subscription_id,:phone


  validates :card_number,  :presence => true
  validates :cvv,  :presence => true
  validates :first_name_on_card,  :presence => true
  validates :last_name_on_card,  :presence => true
  validates :billing_zip,  :presence => true
  validates :first_name,  :presence => true
  validates :last_name,  :presence => true
  validates :email_address,  :presence => true
  validates :phone,  :presence => true




end
