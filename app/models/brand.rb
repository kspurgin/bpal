class Brand < ApplicationRecord
  has_many :scents, dependent: :destroy
end
