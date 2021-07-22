class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
