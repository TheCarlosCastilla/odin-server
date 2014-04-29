class User < ActiveRecord::Base
  belongs_to :valid_user

	def self.next(input)
    valid = ValidUser.where(imei: input)

		if valid.empty?
		#	puts "IMEI is not authorized!"
      puts "Adding IMEI to database!"
      valid = ValidUser.create(imei: input, is_registered: false)
      user = valid.user = self.create(user_id: SecureRandom.uuid, is_claimed: true)
      valid.update(is_registered: true)
      return user.user_id
    elsif valid.first.is_registered
      puts "IMEI is already registered!"
      return valid.first.user.user_id
		else
			if self.where(is_claimed: 'false').empty?
        user = valid.first.user  = self.create(user_id: SecureRandom.uuid, valid_user_id: nil, is_claimed: true)
			  valid.first.update(is_registered: true)
        valid.first.save
        return user.user_id
			end
		end
	end

	def self.to_csv
    CSV.generate do |csv|
      csv << ["user_id"]
      all.each do |user|
        csv << user.attributes.values_at("user_id")
      end
    end
  end

  def self.to_csv_with_imei
    CSV.generate do |csv|
      csv << ["imei", "user_id"]
      ValidUser.all.each do |phone|
        csv << [phone.attributes.values_at("imei"), phone.user.attributes.values_at("user_id")]
      end
      
    end
  end


end
