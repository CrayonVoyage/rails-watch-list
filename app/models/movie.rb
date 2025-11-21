class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error
  validates :title, uniqueness: true
  validates :overview, uniqueness: true
end
