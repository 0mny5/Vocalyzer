class Song < ApplicationRecord
  belongs_to :project

  validates :url, presence: true, format: { with: /http[s]?:\/\/.+/, message: '不正なURLです!' }
  validate :analyze_cannot_be_less_than_one, on: :create

  scope :by_project, ->(project_id) { where(project_id: project_id) }

  private

  def analyze_cannot_be_less_than_one
    unless project && (2..10).cover?(project.songs.size)
      errors.add(:url, '楽曲は２〜１０曲の範囲で登録が可能です。')
    end
  end

end
