class Student < ApplicationRecord
  has_and_belongs_to_many :skills
  has_and_belongs_to_many :interests
  has_and_belongs_to_many :courses

end
