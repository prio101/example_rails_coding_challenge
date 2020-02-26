class Transaction < ActiveRecord::Base
	before_save	:to_cents

	belongs_to	:customer

	COLUMNS = [:id, :created_at, :paid, :amount, :customer_id, :currency, :refunded, :status]

	enum status: { successful: 0, failed: 1, disputed: 2 }
	enum currency:  { usd: 0 }

	scope :select_except, -> (columns) { select(COLUMNS - columns.map { |col| col.to_s }) }
	
	def self.format_data(records)
		result = []
		records.each do |record|
			result << {
									id: record.id,
									created: record.unix_epoch_time_created_at,
									paid: record.paid,
									amount: record.amount,
									currency: record.currency,
									refunded: record.refunded,
									customer_id: record.customer_id
								}
		end
		result
	end

	def to_money		
		case self.currency
		when	'usd'
			sprintf("%0.02f",self.amount.to_f / 100)
		end
	end

	def to_cents
		case self.currency
		when 'usd'
			self.amount * 100
		end
	end

	def unix_epoch_time_created_at
		self.created_at.to_i
	end
end
