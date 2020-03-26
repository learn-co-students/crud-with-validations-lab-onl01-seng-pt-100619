class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        unless record.released && record.release_year <= Date.today.year
            record.errors[:release_year] << 'Need the song to be already released: this year or before!'
        end
    end

end

  class ReleaseDateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value <= Date.today.year
        record.errors[attribute] << (options[:message] || "is not an email")
      end
    end
  end