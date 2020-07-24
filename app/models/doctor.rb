class Doctor < ApplicationRecord
    has_many :cases
    has_secure_password
end
