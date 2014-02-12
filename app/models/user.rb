class User < ActiveRecord::Base

	# TODO: Figure out what is causing this weird type error/ how to access specific model attributes.
	def self.next(input)
		user = self.where(imei: input)

		if !user.empty?
			return user[0].user_id
		else
			if self.where(is_claimed: 'false').count == 0
				return "There are no more available users"
			else
				user = self.where(is_claimed: 'false').first
				user.update(imei: input, is_claimed: 'true')
				return user.user_id
			end
		end
	end

end
