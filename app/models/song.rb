class Song < ApplicationRecord
  belongs_to :project

  validates :url, presence: true
  # validate :analyze_cannot_be_less_than_one
  validate :analyze_cannot_be_less_than_one

  scope :by_project, ->(project_id) { where(project_id: project_id) }

  private

  def sanitize_url
    unless @song.url.match?(/https:\/\/www./)
      @song.url.prepend('https://www.')              
    end
  end

  def analyze_cannot_be_less_than_one
    unless project && (2..10).cover?(project.songs.size)
      errors.add(:url, '楽曲は２〜１０曲の範囲で登録が可能です。')
    end
  end

end
