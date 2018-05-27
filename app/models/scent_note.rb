class ScentNote < ApplicationRecord
  belongs_to :scent, touch: true
  belongs_to :note, touch: true
end
