class ChargesController < ApplicationController
  def index
    @charges_failed = Transaction.where(status: 'failed')
    @charges_successful = Transaction.where(status: 'successful')
    @charges_disputed = Transaction.where(status: 'disputed')
  end

  def charges
    Transaction.format_data(Transaction.select_except([:status]))
    render json: @charges
  end
end
