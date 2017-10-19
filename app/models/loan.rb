class Loan < ActiveRecord::Base
  has_many :payments

  def payment_amounts
    payments.map(&:payment_amount)
  end

  def calculate_total_paid
    payment_amounts.inject(:+) || 0
  end

  def outstanding_balance
    funded_amount - calculate_total_paid
  end
end
