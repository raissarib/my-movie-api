class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  enum genre: {
    action: "Action",
    drama: "Drama",
    comedy: "Comedy",
    sci_fi: "Sci-Fi",
    thriller: "Thriller"
  }

  validates :genre, inclusion: { in: genres.keys }
end
