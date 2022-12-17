class Project < ApplicationRecord
  belongs_to :user
  has_many :songs, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true

  has_one_attached :og_image

  before_create -> { self.uuid = SecureRandom.uuid }

  validates :title, presence: true
  validate :analyze_cannot_be_less_than_two

  private

  def analyze_cannot_be_less_than_two
    unless (2..10).cover?(songs.size)
      errors.add(:song, 'は２〜１０曲の範囲で登録が可能です')
    end
  end
end
