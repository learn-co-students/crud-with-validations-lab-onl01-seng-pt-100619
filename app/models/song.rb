class Song < ApplicationRecord
    # include ActiveModel::Validations

    attr_accessor :release_year

    validates :title, presence: true, uniqueness: {scope: :release_year}
    validates :released, inclusion: { in: [true, false] }
    validates :released, exclusion: { in: [nil] }
    # validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    validates :artist_name, presence: true

    with_options if: :has_it_been_released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    
      def has_it_been_released?
        released
      end



end
