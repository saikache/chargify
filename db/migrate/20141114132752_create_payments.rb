class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :card_number
      t.string :cvv
      t.date :expiration_date
      t.string :first_name_on_card
      t.string :last_name_on_card
      t.string :billing_zip
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :string
      t.string :organization
      t.string :subscription_id

      t.timestamps
    end
  end
end
