class Match < ApplicationRecord
  validates :material, :wish, presence: true
end
