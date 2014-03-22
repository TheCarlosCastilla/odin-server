class User < ActiveRecord::Base
  belongs_to :valid_user

	def self.next(input)
    valid = ValidUser.where(imei: input)

		if valid.empty?
			puts "IMEI is not authorized!"
    elsif valid.first.is_registered
      puts "IMEI is already registered!"
      return valid.first.user.user_id
		else
			if self.where(is_claimed: 'false').empty?
        user = valid.first.user  = self.create(user_id: SecureRandom.uuid, valid_user_id: nil, is_claimed: true)
			  valid.first.update(is_registered: true)
        valid.first.save
        return valid.first.user.user_id
			end
		end
	end

end
