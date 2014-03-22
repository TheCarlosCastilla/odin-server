class User < ActiveRecord::Base
  belongs_to :valid_user

	def self.next(input)
    valid = ValidUser.where(imei: input)

		if valid.empty?
			return "IMEI is not authorized!"
    elsif valid.first.is_registered
      return "IMEI is already registered!"
		else
			if self.where(is_claimed: 'false').empty?
        valid.first.user  = self.create(user_id: SecureRandom.uuid, valid_user_id: nil, is_claimed: true)
			  valid.first.update(is_registered: true)
        valid.first.save
			end
		end
	end

end
