class Note < ApplicationRecord
  has_many :scent_notes
  has_many :scents, through: :scent_notes
end
