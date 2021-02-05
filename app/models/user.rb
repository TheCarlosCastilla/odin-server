class User < ApplicationRecord
  require 'digest'
  include MyModule

  belongs_to :valid_user

	#def self.next(imei, phone)
  def self.next(imei)
    valid = ValidUser.where(imei: imei)

    if valid.empty?
		  #log_request_without_params("IMEI is not authorized!")
      ##puts "Adding IMEI to database!"
      #valid = ValidUser.create(imei: imei, is_registered: false)
      ##user = valid.user = self.create(user_id: SecureRandom.uuid, hashed_number: Digest::MD5.hexdigest(phone), is_claimed: true)
      #user = valid.user = self.create(user_id: SecureRandom.uuid, hashed_number: nil, is_claimed: true)
      #valid.update(is_registered: true)
      #return user.user_id
      return nil
    elsif valid.first.is_registered
      #log_request_without_params("IMEI is already registered!")
      return valid.first.user.user_id
    else
 	    if self.where(is_claimed: 'false').empty?
        #user = valid.first.user  = self.create(user_id: SecureRandom.uuid, hashed_number: Digest::MD5.hexdigest(phone), valid_user_id: nil, is_claimed: true)
        user = valid.first.user  = self.create(user_id: SecureRandom.uuid, hashed_number: nil, valid_user_id: nil, is_claimed: true)
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
