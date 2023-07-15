# db/migrate/20230712172528_change_amount_data_type_in_payments.rb

  class ChangeAmountDataTypeInPayments < ActiveRecord::Migration[7.0]
    def change
      change_column :payments, :amount, :decimal
    end
  end
