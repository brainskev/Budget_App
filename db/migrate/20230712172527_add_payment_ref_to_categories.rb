class AddPaymentRefToCategories < ActiveRecord::Migration[7.0]
     def change
     add_reference :categories, :payment, foreign_key: true
   end
end
