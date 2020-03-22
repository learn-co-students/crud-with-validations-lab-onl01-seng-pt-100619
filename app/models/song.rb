class Song < ApplicationRecord
   include ActiveModel::Validations
    validates_with SongValidator
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year}
    validates :title, uniqueness: {scope: :artist_name}
    validates :artist_name, presence: true
    validates :genre, presence: true
end
