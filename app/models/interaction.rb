class Interaction < ActiveRecord::Base


  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      find_each do |interaction|
        csv << interaction.attributes.values_at(*column_names)
      end
    end
  end

end
