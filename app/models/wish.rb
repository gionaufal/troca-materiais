class Wish < ApplicationRecord
  validates :product, :volume, :wish, presence: true
  belongs_to :user
  belongs_to :match, optional: true
end
