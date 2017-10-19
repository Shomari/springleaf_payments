require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  let!(:loan) { Loan.create!(funded_amount: 2500.0) }
  let!(:payment1) { Payment.create!(payment_amount: 20.0, loan_id: loan.id) }

  describe '#index' do
    it 'responds with a 200 with a valid loan id' do
      get :index, loan_id: loan.id
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    it 'responds with 200 when valid payment params are sent' do
      params = { loan_id: loan.id, payment_amount: 20 }
      post :create, params
      expect(response).to have_http_status(:ok)
    end

    # This test also makes sure the validator on the model is working
    it 'responds with 422 if payment amount is greater than outsanding balance' do
      params = {loan_id: loan.id, payment_amount: 200000}
      post :create, params
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe '#show' do
    it 'responds with 200 when valid show params' do
      get :show, id: payment1.id
      expect(response).to have_http_status(:ok)
    end

    it 'responds with 404 if the loan is not found' do
      get :show, id: 499999
      expect(response).to have_http_status(:not_found)
    end
  end
end
