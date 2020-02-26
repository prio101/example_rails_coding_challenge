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
		first_name: Faker::Name.unique.first_name, 
		last_name: Faker::Name.last_name 
	)
end

# status: successful
5.times { CustomSeed.transaction_body(1, 0) }

# status: disputed
CustomSeed.transaction_body(1, 2)


# status: successful
3.times { CustomSeed.transaction_body(2, 0) }

# status: disputed
CustomSeed.transaction_body(2, 2)



# successful
CustomSeed.transaction_body(3, 0)

# failed
3.times	{	CustomSeed.transaction_body(3, 1) }



# successful
CustomSeed.transaction_body(4, 0)

# failed
2.times { CustomSeed.transaction_body(4, 1) }





