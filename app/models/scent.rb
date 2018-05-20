class Scent < ApplicationRecord
  belongs_to :brand, touch: true
  has_many :scent_notes
  has_many :notes, through: :scent_notes, :counter_cache => true
end
