class ChargesController < ApplicationController
  def index
    @charges_failed = Transaction.where(status: 1)
    @charges_successful = Transaction.where(status: 0)
    @charges_disputed = Transaction.where(status: 2)
  end

  def charges
    Transaction.format_data(Transaction.select_except([:status]))
    render json: @charges
  end
end
