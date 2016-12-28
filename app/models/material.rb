class Material < ApplicationRecord
  validates :product, :volume, :wish, presence: true
end
