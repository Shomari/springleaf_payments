class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :payment_amount
      t.belongs_to :loan

      t.timestamps null: false
    end
  end
end
