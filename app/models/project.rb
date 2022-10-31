class Project < ApplicationRecord
  has_many :songs, inverse_of: :project, dependent: :destroy
  accepts_nested_attributes_for :songs, allow_destroy: true
  belongs_to :user

  has_one_attached :og_image

  validates :title, presence: true

end
