class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def to_s
    try(:name)
  end
end
