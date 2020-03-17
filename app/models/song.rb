class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: %w(true false)}
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: :current_year }
  validates :artist_name, presence: true
  
  
  def released?
    released == true
  end 
  
  def not_released?
  end
  
  def current_year
    current_year = 2020
    current_year
  end
end
