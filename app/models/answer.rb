class Answer < ApplicationRecord

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |answer|
        csv << answer.attributes.values_at(*column_names)
      end
    end
  end

end
