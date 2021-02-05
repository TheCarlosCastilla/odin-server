class Call < ApplicationRecord

	def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      find_each do |call|
        csv << call.attributes.values_at(*column_names)
      end
    end
  end

end
