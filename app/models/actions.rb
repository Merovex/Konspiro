class Actions < ActiveRecord::Base
  belongs_to :attacker
  belongs_to :defender

	def modifiers(i)
		c = 0
		c += (attacker.kratos + defender.kratos).abs / 6 			 # Aligned? (0..1)
		c += (attacker.reverence + defender.reverence).abs / 6 # Aligned? (0..1)
		c += (attacker.sector + defender.sector).abs / 6 			 # Aligned? (0..1)
		c += (attacker.law + defender.law).abs / 6 						 # Aligned? (0..1)
		c += (attacker.reverence + defender.reverence).abs / 6 # Aligned? (0..1)
		c += (attacker.politics + defender.politics).abs / 6 	 # Aligned? (0..1)
		c += (attacker.zeal - defender.zeal).abs / 6 					 # Opposed? (0..1)
		c += (attacker.odd - defender.odd).abs / 6 						 # Opposed? (0..1) Total (0..7)
		c -= i
		c -= 2 if defender.is_guarded
		return c
	end
	def manipulate
		if (attacker.manipulate + modifiers(defender.parry))
			defender.manipulated!
		end
	end
	def control
		if (attacker.attack + modifiers(defender.parry)) > 0
			defender.wounds += ((defender.toughness - (strength + agility)) / 4).floor
			if defender.wounds > 3
				defender.wounds = 3
				# Add Defender to list of Attacker Properties
				# Determine if Publicized
			end
		end
	end
	def publicize
		m = defender.secrecy - (attacker.secrecy / 2).to_i

	end
	def study
		# Deep interrogatory into an organization's History
		# -4 unless Controlled
	end
end
