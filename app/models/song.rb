class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year}
    validate :song_validator
  
    def song_validator
      if release_year.nil? && released == true
        errors.add(:release_year, "Release year must be added")
      elsif release_year.nil? && released == false
        nil
      elsif release_year > Date.current.year
        errors.add(:release_year, "Release year must be before #{Date.current.year}")
      end
    end
    
end
