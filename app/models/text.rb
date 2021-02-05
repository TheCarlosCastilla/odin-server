class Text < ApplicationRecord

	def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      find_each do |text|
        csv << text.attributes.values_at(*column_names)
      end
    end
  end

end
