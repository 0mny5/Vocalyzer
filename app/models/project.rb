class Project < ApplicationRecord
  belongs_to :user
  has_many :songs, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true

  has_one_attached :og_image

  before_create -> { self.uuid = SecureRandom.uuid }

  validates :title, presence: true
end
