class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validate :song_validator
  # validates :release_year, numericality: {less_than: Time.now.year}

  def song_validator
    if release_year.nil? && released == true
      errors.add(:release_year, "Release year must be added")
    elsif release_year.nil? && released == false
      nil
    elsif release_year > Time.now.year
      errors.add(:release_year, "Release year must be before #{Time.now.year}")
    end
  end
end
