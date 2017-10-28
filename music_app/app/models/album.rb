class Album < ApplicationRecord
  validates :title,:year,:band, presence: true
  validates :studio_album, inclusion: {in: [true,false]}

  belongs_to :band

  has_many :tracks
end
