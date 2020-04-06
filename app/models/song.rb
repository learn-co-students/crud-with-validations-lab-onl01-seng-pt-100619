class Song < ApplicationRecord
    validates :title, :artist_name, presence: true 
    validates :title, uniqueness: {scope: [:release_year, :artist_name]} 
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released, presence: true
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, allow_blank: true 
    validates :release_year, presence: true, unless: :realeased, presence: false, allow_blank: true 
  
end

#Must not be blank if released is true
#Must be less than or equal to the current year
#validates :release_year, inclusion: { in: [true, false] }
#if true !release_year.nil
    #< || = current_year 
