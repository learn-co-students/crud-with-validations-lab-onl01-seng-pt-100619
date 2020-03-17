class Song < ApplicationRecord
  validates :song, presence: true
  validates :released, inclusive: { in: %w(true false)}
  validates :release_year, presence: true if: :released?
  validates :release_year, numerically: { less_than_or_equal_to: :current_year }
  validates :artist_name, presence: true
  
  
  def released?
    Song.released == true
  end 
  
  def not_released?
  end
  
  def current_year
    current_year = 2020
    current_year
  end
end
