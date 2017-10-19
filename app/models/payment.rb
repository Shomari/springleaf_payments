class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :payment_amount, :loan, presence: true
  validate :check_loan_balance, on: :create

  def check_loan_balance
    if loan.outstanding_balance < payment_amount
      errors.add(:loan_balance, "payment can not exceed the outsanding balance of the loan")
    end
  end
end
