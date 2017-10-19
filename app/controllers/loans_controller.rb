class LoansController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  # I'm guessing that you want the outsanding balance for all loans to be
  # returned here
  def index
    render json: Loan.all
  end


  def show
    loan = Loan.find(params[:id])
    render json: {'outstanding_balance': loan.outstanding_balance}
  end
end
