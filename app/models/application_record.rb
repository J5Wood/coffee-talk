class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def stars_validator
    if stars.blank? || !stars.to_s.match(/[12345]/) || stars.to_s.length != 1
      self.errors.add(:stars, 'Required')
    end
  end
end
