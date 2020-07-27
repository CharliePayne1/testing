class Case < ApplicationRecord
  belongs_to :doctor, optional: true

  validates :symptoms, presence: true
  validates :email, presence: true
  
end
