class Song < ApplicationRecord

    validates :title, presence: true 
    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: "- Cannot release duplicate title in same year"}

    validates :artist_name, presence: true
    validates :released, inclusion: {in: [true, false]}

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year 
        }
    end 


#release_year optional if 'released' is false, not blank if 'released' is true , year must be less than or equal to the current year

    def released?
        released 
    end 

end
