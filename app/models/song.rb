class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with SongValidator
    validates :title, presence: true
    validates :title, uniqueness: {scope: :release_year}
end
