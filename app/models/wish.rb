class Wish < ApplicationRecord
  validates :product, :volume, :wish, presence: true
  belongs_to :user
end
