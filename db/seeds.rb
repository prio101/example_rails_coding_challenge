# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class CustomSeed
	require 'faker'

	def self.transaction_body(customer_id, status)
		Transaction.create(
			amount:  Faker::Number.digit,
			currency: :usd,
			status: status,
			paid: true,
			customer_id: customer_id,
		)
	end
end

4.times do
	Customer.create(
		[ 
			{ 
				first_name: Faker::Name.unique.first_name, 
				last_name: Faker::Name.last_name 
			}
		]
	)
end

if(Customer.exists?(1))
	# status: successful
  5.times { CustomSeed.transaction_body(1, :successful) }
	
	# status: disputed
	CustomSeed.transaction_body(1, :disputed)
end

if(Customer.exists?(2))
	# status: successful
	5.times { CustomSeed.transaction_body(2, :successful) }
	
	# status: disputed
	CustomSeed.transaction_body(2, :disputed)
end

if(Customer.exists?(3))
	# successful
	CustomSeed.transaction_body(3, :successful)
	
	# failed
	3.times	{	CustomSeed.transaction_body(3, :failed) }
end

if(Customer.exists?(4))
	# successful
	CustomSeed.transaction_body(4, :successful)

	# failed
	4.times { CustomSeed.transaction_body(4, :failed) }
end




