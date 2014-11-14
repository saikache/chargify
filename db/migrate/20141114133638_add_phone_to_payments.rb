class AddPhoneToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :phone, :string
  end
end
