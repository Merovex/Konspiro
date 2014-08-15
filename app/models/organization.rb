class Organization < ActiveRecord::Base
	

	def politics
		[personal, economic, political].inject(:+)
	end
	def is_guarded
		return DateTime.now < guarded_until
	end
	def manipulate
		return Random.rand(1..fight) - modifiers
	end
	def manipulated!
		manipulated_until = DateTime.now + 0
	end
	def is_manipulated
		# return DateTime.now < guarded_until
	end

	# Organizational Combat
	# =====================
	def modifiers
		m = 0
		m += 2 if is_manipulated
		m += wounds
	end
	def attack
		return Random.rand(1..fight) - modifiers
	end
	def parry
		(2 + 0.5 * fight).to_i - modifiers
	end
	def toughness
		(2 + 0.5 * vigor).to_i - modifiers
	end

end
