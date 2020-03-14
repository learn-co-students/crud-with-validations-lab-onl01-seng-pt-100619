class Song < ApplicationRecord
    validate :release_year_if_released
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
    validates :artist_name, presence: true
    
    def release_year_if_released
        if !release_year.present? && released
            errors.add(:release_year, "A release year is necessary.")
        elsif release_year.present? && release_year > Date.current.year && released
            errors.add(:release_year, "Release year cannot be a future year.")
        end
    end
end
