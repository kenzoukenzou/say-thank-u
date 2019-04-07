FactoryBot.define do
	factory :post do
		content {'test content'}
		user
	end
end