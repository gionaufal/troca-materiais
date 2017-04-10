class Wish < ApplicationRecord
  validates :product, :volume, :wish, presence: true
end
