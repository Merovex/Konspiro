# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
require 'securerandom'
# random_string = SecureRandom.hex
class Integer
	def dF
		self.times.map{ Random.rand(-1..1) }.inject(:+)
	end
end


100.times do 
	Organization.create(
		:name       => SecureRandom.hex,
		:slogan     => SecureRandom.hex,
		:strength   => Random.rand(0..3),
		:notice     => Random.rand(0..3),
		:vigor      => Random.rand(0..3),
		:toughness  => Random.rand(0..3),
		:agility    => Random.rand(0..3),
		:wounds     => 0,
		:fight     => Random.rand(0..3),

		:cp => Random.rand(0..3),
		:secrecy => 3.dF,
		# Cash
		:wealth => Random.rand(0..3),
		:income => Random.rand(0..7),
		# t.string  :type 

		:kratos => 3.dF,
		:reverence => 3.dF,
		:sector => 3.dF,
		:law => 3.dF,
		:zeal => 3.dF,
		:odd => 3.dF,

		# Politics
		:personal => 3.dF,
		:economic => 3.dF,
		:political => 3.dF
	)
end