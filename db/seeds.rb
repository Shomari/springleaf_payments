loan = Loan.create!(funded_amount: 100.0)
Payment.create!(payment_amount: 20, loan_id: loan.id)
Payment.create!(payment_amount: 35, loan_id: loan.id)
