class Note < ApplicationRecord
  has_many :scent_notes, dependent: :destroy
  has_many :scents, through: :scent_notes
end
