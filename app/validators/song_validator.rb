class SongValidator < ActiveModel::Validator
    def validate(record)
        if record.released && record.release_year.nil?
            record.errors[:release_year] << "Must enter a release year."
        end
        if !record.release_year.nil? && record.release_year > Date.current.year
            record.errors[:release_year] << "Release year cannot be in the future."
        end
    end
end