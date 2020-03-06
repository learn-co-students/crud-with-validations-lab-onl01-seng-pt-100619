class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: :release_year}
  validates :release_year, presence: true, unless: :released?
  validates :release_year, numericality: {less_than: Time.now.year}
end
