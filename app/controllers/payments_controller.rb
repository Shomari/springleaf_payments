class PaymentsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |exception|
    render json: exception, status: :unprocessable_entity
  end

  def index
    loan = Loan.find params[:loan_id]
    render json: loan.payments
  end

  def show
    render json: Payment.find(params[:id])
  end

  def create
    Payment.create!(payment_params)
    render json: {}, status: :ok
  end

  private

  # Just an example of using strong params. Not really necessary since there is
  # only one
  def payment_params
    params.permit(:payment_amount, :loan_id)
  end
end
