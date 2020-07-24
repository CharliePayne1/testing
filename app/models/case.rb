class Case < ApplicationRecord
  belongs_to :doctor, optional: true
end
